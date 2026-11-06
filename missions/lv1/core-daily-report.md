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
제공된 `daily-report` 스킬을 설치하고, 에이전트가 **오늘 일정**(`data/schedule/today.md`, 데모용)을 조회해 일일 브리핑 리포트를 만들게 하세요.

## 절차 (레시피)
1. 이 레포 최상위에서 스킬을 설치합니다:
   - **opencode**
     - Linux: `mkdir -p .opencode/skills && cp -r skills-given/daily-report .opencode/skills/`
     - Windows(PowerShell): `New-Item -Type Directory -Force .opencode\skills | Out-Null; Copy-Item -Recurse skills-given\daily-report .opencode\skills\`
   - **Claude Code**
     - Linux: `mkdir -p .claude/skills && cp -r skills-given/daily-report .claude/skills/`
     - Windows(PowerShell): `New-Item -Type Directory -Force .claude\skills | Out-Null; Copy-Item -Recurse skills-given\daily-report .claude\skills\`
2. 에이전트가 스킬을 다시 불러오게 합니다.
   - opencode: 재시작합니다. (스킬은 시작 시점에 로드됩니다)
   - Claude Code: 대화창에 `/reload-skills`를 입력합니다. 세션 도중에 처음 만든 `.claude/skills` 폴더는 Claude Code가 아직 감시하지 않으므로, 이 레포에서는 **스킬을 넣거나 고칠 때마다 `/reload-skills`를 실행**한다고 기억하세요. `/skills`를 입력하면 `daily-report`가 목록에 보이는지 확인할 수 있습니다.
3. 에이전트에게 말합니다: **"오늘 일정 브리핑해줘"**
4. `output/daily-report.md`가 생겼는지 확인합니다.

## 성공 조건
- `output/daily-report.md` 파일이 존재하고, 스킬이 남긴 서명 문구가 포함되어 있을 것
- 리포트 내용이 일정 요약일 것

## 검증
- Linux&nbsp;&nbsp;&nbsp;: `./check.sh core-daily-report`
- Windows: `check.bat core-daily-report`  (또는 `check.bat` 더블클릭 후 id 입력 — 창은 결과 확인 후 닫으면 됩니다)
통과하면 성장 코드가 출력됩니다. 웹 보드에 입력하세요.

> 💡 막히면 에이전트에게 물어보세요. 그것도 훌륭한 플레이입니다.
>
> ⚠️ Claude Code 사용자: `/daily-report`처럼 슬래시로 스킬을 직접 호출하지 말고 **자연어로 요청**하세요. 이 게임은 에이전트가 description을 보고 스킬을 스스로 골라 발동하는지를 시험합니다.
