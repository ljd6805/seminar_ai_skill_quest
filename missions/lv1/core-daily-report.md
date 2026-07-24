---
id: core-daily-report
level: 1
track: core
title: "부팅 — 첫 스킬 장착"
check: script
---

# Lv.1 부팅 — 첫 스킬 장착

당신의 에이전트는 아직 이 팀의 일하는 방식을 하나도 모릅니다.
첫 스킬을 장착시켜 봅시다.

## 목표
제공된 `daily-report` 스킬을 설치하고, 에이전트가 **오늘의 작업 기록**(`data/today-worklog.md`, 데모용)을 일일 리포트로 요약하게 하세요.

## 절차 (레시피)
1. 이 레포 최상위에서 스킬을 설치합니다:
   - Linux: `mkdir -p .opencode/skills && cp -r skills-given/daily-report .opencode/skills/`
   - Windows(PowerShell): `New-Item -Type Directory -Force .opencode\skills | Out-Null; Copy-Item -Recurse skills-given\daily-report .opencode\skills\`
2. opencode를 재시작합니다. (스킬은 시작 시점에 로드됩니다)
3. 에이전트에게 말합니다: **"오늘 작업 요약해줘"**
4. `output/daily-report.md`가 생겼는지 확인합니다.

## 성공 조건
- `output/daily-report.md` 파일이 존재하고, 스킬이 남긴 서명 문구가 포함되어 있을 것
- 리포트 내용이 작업 기록 요약일 것 (git 상태 같은 엉뚱한 정보가 아니라)

## 검증
- Linux&nbsp;&nbsp;&nbsp;: `./check.sh core-daily-report`
- Windows: `check.bat core-daily-report`  (또는 `check.bat` 더블클릭 후 id 입력 — 창은 결과 확인 후 닫으면 됩니다)
통과하면 성장 코드가 출력됩니다. 웹 보드에 입력하세요.

> 💡 막히면 에이전트에게 물어보세요. 그것도 훌륭한 플레이입니다.
