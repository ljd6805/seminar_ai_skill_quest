#!/usr/bin/env bash
# SKILL QUEST 채점기 — 사용법: ./check.sh <mission-id>
# 통과 시 성장 코드(GROW-Lx-XXXX)를 출력합니다. 웹 보드에 입력하세요.
set -u
SALT="skill-quest-2026-hbd"
ID="${1:-}"

pass() { # $1=level
  local code
  code=$(printf "%s%s" "$ID" "$SALT" | sha256sum | cut -c1-4 | tr 'a-f' 'A-F')
  echo ""
  echo "  ╔══════════════════════════════════╗"
  echo "  ║  ✔ MISSION CLEAR!                ║"
  echo "  ║  성장 코드: GROW-L$1-$code        ║"
  echo "  ╚══════════════════════════════════╝"
  echo "  웹 보드에 코드를 입력해 레벨업하세요."
  exit 0
}

fail() { echo ""; echo "  ✘ 아직입니다 — $1"; echo "  (막히면 에이전트에게 물어보는 것도 훌륭한 플레이입니다)"; exit 1; }

need_file() { [ -f "$1" ] || fail "$1 파일이 없습니다. 스킬이 발동되어 파일을 만들었는지 확인하세요."; }

ask() { # $1=question → y면 통과, 아니면 fail
  echo ""
  read -r -p "  $1 (y/n) " a
  [ "$a" = "y" ] || [ "$a" = "Y" ] || fail "직접 확인 후 다시 실행해주세요."
}

case "$ID" in

  core-daily-report)
    need_file output/daily-report.md
    grep -q "GENERATED-BY: daily-report-skill" output/daily-report.md \
      || fail "리포트에 스킬 서명이 없습니다. 스킬이 정말 발동됐을까요? (에이전트가 스킬 없이 그냥 써준 것일 수도 있습니다)"
    pass 1 ;;

  core-fix-log-digest)
    need_file output/log-digest.md
    grep -q "GENERATED-BY: log-digest-skill" output/log-digest.md \
      || fail "스킬 서명이 없습니다. description을 고친 뒤 opencode를 재시작했나요?"
    for kw in assertion timeout build; do
      grep -qi "$kw" output/log-digest.md || fail "'$kw' 버킷이 리포트에 보이지 않습니다."
    done
    grep -qiE "환경|env" output/log-digest.md || fail "환경(env) 버킷이 리포트에 보이지 않습니다."
    pass 2 ;;

  core-build-report)
    need_file output/test-report.md
    [ -f .opencode/skills/test-report/SKILL.md ] \
      || fail "스킬이 .opencode/skills/test-report/SKILL.md 위치에 없습니다. (이름은 test-report로 통일해주세요)"
    grep -q "TOTAL_PASS: 12" output/test-report.md || fail "TOTAL_PASS 값이 없거나 틀렸습니다. 스킬이 CSV를 제대로 집계했는지 확인하세요."
    grep -q "TOTAL_FAIL: 5"  output/test-report.md || fail "TOTAL_FAIL 값이 없거나 틀렸습니다."
    pass 3 ;;

  core-scope-guard)
    [ -f .opencode/skills/test-report/SKILL.md ] || fail "test-report 스킬이 설치되어 있지 않습니다."
    echo "  [Lv.4 확인] 두 프롬프트를 에이전트에게 실제로 시험해보고 답해주세요."
    ask "A. \"테스트 결과 리포트 만들어줘\" 에 test-report 스킬이 발동했나요?"
    ask "B. \"오늘 일정을 리포트로 정리해줘\" 에 test-report가 발동하지 않았나요? (daily-report가 처리하는 게 정상)"
    pass 4 ;;

  core-silent-skill)
    need_file output/fail-summary.md
    grep -q "GENERATED-BY: fail-summary-skill" output/fail-summary.md \
      || fail "스킬 서명이 없습니다. description은 본문과 같은 이야기를 하고 있나요?"
    pass 5 ;;

  core-my-first-skill)
    FOUND=""
    for d in .opencode/skills/*/; do
      name=$(basename "$d")
      case "$name" in daily-report|log-digest|fail-summary|test-report) continue ;; esac
      [ -f "$d/SKILL.md" ] && FOUND="$name"
    done
    [ -n "$FOUND" ] || fail "새로 만든 스킬이 보이지 않습니다. .opencode/skills/<이름>/SKILL.md 로 만들어주세요."
    desc=$(grep -m1 "^description:" ".opencode/skills/$FOUND/SKILL.md" | cut -d: -f2-)
    [ "${#desc}" -ge 20 ] || fail "'$FOUND'의 description이 너무 짧습니다. 실제로 할 말(트리거 표현)을 담아 조금 더 구체적으로 써보세요."
    echo "  [Lv.6 확인] 발견된 스킬: $FOUND"
    ask "이 스킬을 실제 프롬프트로 발동시키는 데 성공했나요?"
    pass 6 ;;

  core-power-up)
    [ -f .opencode/skills/test-report/scripts/aggregate.py ] \
      || fail "스크립트가 .opencode/skills/test-report/scripts/aggregate.py 위치에 없습니다."
    need_file output/test-report-v2.md
    TOKEN=$(sha1sum data/test_results.csv | cut -c1-6)
    grep -q "AGG-TOKEN: $TOKEN" output/test-report-v2.md \
      || fail "AGG-TOKEN이 없거나 틀렸습니다. 에이전트가 스크립트를 '진짜로' 실행했을까요? SKILL.md 지시를 다듬어보세요."
    pass 7 ;;

  "")
    echo "사용법: ./check.sh <mission-id>"
    echo "미션 목록:"; ls missions/*/*.md | sed 's|missions/lv[0-9]*/||; s|\.md||; s|^|  - |' ;;

  *)
    fail "알 수 없는 미션 id 입니다: $ID (./check.sh 로 목록 확인)" ;;
esac
