param([string]$Id = "")
try { [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 } catch {}
$SALT = "skill-quest-2026-hbd"

function Get-GrowthCode([string]$mid) {
  $sha = [System.Security.Cryptography.SHA256]::Create()
  $hash = $sha.ComputeHash([System.Text.Encoding]::UTF8.GetBytes($mid + $SALT))
  $hex = ($hash | ForEach-Object { $_.ToString("x2") }) -join ""
  return $hex.Substring(0,4).ToUpper()
}

function Pass([int]$Lvl) {
  $code = Get-GrowthCode $Id
  Write-Host ""
  Write-Host "  ======================================"
  Write-Host "    [V] MISSION CLEAR!"
  Write-Host "    성장 코드: GROW-L$Lvl-$code"
  Write-Host "  ======================================"
  Write-Host "  웹 보드에 코드를 입력해 레벨업하세요."
  exit 0
}

function Fail([string]$Msg) {
  Write-Host ""
  Write-Host "  [X] 아직입니다 - $Msg"
  Write-Host "  (막히면 에이전트에게 물어보는 것도 훌륭한 플레이입니다)"
  exit 1
}

function Need-File([string]$Path) {
  if (-not (Test-Path $Path)) { Fail "$Path 파일이 없습니다. 스킬이 발동되어 파일을 만들었는지 확인하세요." }
}

function Ask([string]$Q) {
  $a = Read-Host "  $Q (y/n)"
  if ($a -ne "y" -and $a -ne "Y") { Fail "직접 확인 후 다시 실행해주세요." }
}

function Has([string]$File, [string]$Pattern) {
  return [bool](Select-String -Path $File -Pattern $Pattern -Quiet)
}

if ($Id -eq "") {
  Write-Host "SKILL QUEST 채점기 - 미션 목록:"
  Get-ChildItem -Path "missions" -Recurse -Filter *.md | ForEach-Object { Write-Host ("  - " + $_.BaseName) }
  $Id = (Read-Host "채점할 미션 id 를 입력하세요").Trim()
  if ($Id -eq "") { Fail "미션 id 가 입력되지 않았습니다." }
}

switch ($Id) {

  "core-daily-report" {
    Need-File "output/daily-report.md"
    if (-not (Has "output/daily-report.md" "GENERATED-BY: daily-report-skill")) {
      Fail "리포트에 스킬 서명이 없습니다. 스킬이 정말 발동됐을까요? (에이전트가 스킬 없이 그냥 써준 것일 수도 있습니다)" }
    Pass 1 }

  "core-fix-log-digest" {
    Need-File "output/log-digest.md"
    if (-not (Has "output/log-digest.md" "GENERATED-BY: log-digest-skill")) {
      Fail "스킬 서명이 없습니다. description을 고친 뒤 opencode를 재시작했나요?" }
    foreach ($kw in @("assertion","timeout","build")) {
      if (-not (Has "output/log-digest.md" $kw)) { Fail "'$kw' 버킷이 리포트에 보이지 않습니다." } }
    if (-not (Has "output/log-digest.md" "환경|env")) { Fail "환경(env) 버킷이 리포트에 보이지 않습니다." }
    Pass 2 }

  "core-build-report" {
    Need-File "output/test-report.md"
    if (-not (Test-Path ".opencode/skills/test-report/SKILL.md")) {
      Fail "스킬이 .opencode/skills/test-report/SKILL.md 위치에 없습니다. (이름은 test-report로 통일해주세요)" }
    if (-not (Has "output/test-report.md" "TOTAL_PASS: 12")) { Fail "TOTAL_PASS 값이 없거나 틀렸습니다. 스킬이 CSV를 제대로 집계했는지 확인하세요." }
    if (-not (Has "output/test-report.md" "TOTAL_FAIL: 5"))  { Fail "TOTAL_FAIL 값이 없거나 틀렸습니다." }
    Pass 3 }

  "core-scope-guard" {
    if (-not (Test-Path ".opencode/skills/test-report/SKILL.md")) { Fail "test-report 스킬이 설치되어 있지 않습니다." }
    Write-Host "  [Lv.4 확인] 두 프롬프트를 에이전트에게 실제로 시험해보고 답해주세요."
    Ask '"테스트 결과 리포트 만들어줘" 에 test-report 스킬이 발동했나요?'
    Ask '"지난 분기 실적 리포트 초안 써줘" 에는 발동하지 않았나요?'
    Pass 4 }

  "core-silent-skill" {
    Need-File "output/fail-summary.md"
    if (-not (Has "output/fail-summary.md" "GENERATED-BY: fail-summary-skill")) {
      Fail "스킬 서명이 없습니다. description은 본문과 같은 이야기를 하고 있나요?" }
    Pass 5 }

  "core-my-first-skill" {
    $found = ""
    if (Test-Path ".opencode/skills") {
      foreach ($d in (Get-ChildItem ".opencode/skills" -Directory)) {
        if (@("daily-report","log-digest","fail-summary","test-report") -contains $d.Name) { continue }
        if (Test-Path (Join-Path $d.FullName "SKILL.md")) { $found = $d.Name }
      }
    }
    if ($found -eq "") { Fail "새로 만든 스킬이 보이지 않습니다. .opencode/skills/<이름>/SKILL.md 로 만들어주세요." }
    $descLine = (Select-String -Path ".opencode/skills/$found/SKILL.md" -Pattern "^description:" | Select-Object -First 1)
    $desc = ""
    if ($descLine) { $desc = $descLine.Line.Substring("description:".Length).Trim() }
    if ($desc.Length -lt 20) { Fail "'$found'의 description이 너무 짧습니다. 실제로 할 말(트리거 표현)을 담아 조금 더 구체적으로 써보세요." }
    Write-Host "  [Lv.6 확인] 발견된 스킬: $found"
    Ask "이 스킬을 실제 프롬프트로 발동시키는 데 성공했나요?"
    Pass 6 }

  "core-power-up" {
    if (-not (Test-Path ".opencode/skills/test-report/scripts/aggregate.py")) {
      Fail "스크립트가 .opencode/skills/test-report/scripts/aggregate.py 위치에 없습니다." }
    Need-File "output/test-report-v2.md"
    $token = (Get-FileHash "data/test_results.csv" -Algorithm SHA1).Hash.Substring(0,6).ToLower()
    if (-not (Has "output/test-report-v2.md" ("AGG-TOKEN: " + $token))) {
      Fail "AGG-TOKEN이 없거나 틀렸습니다. 에이전트가 스크립트를 '진짜로' 실행했을까요? SKILL.md 지시를 다듬어보세요." }
    Pass 7 }

  default { Fail "알 수 없는 미션 id 입니다: $Id (인자 없이 실행하면 목록이 표시됩니다)" }
}
