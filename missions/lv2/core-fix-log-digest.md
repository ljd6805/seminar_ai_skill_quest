---
id: core-fix-log-digest
level: 2
track: core
title: "첫 수리 — 고장난 스킬"
check: script
---

# Lv.2 첫 수리 — 고장난 스킬

`skills-broken/log-digest` 스킬을 전임자가 남기고 떠났습니다.
분명 regression 로그를 요약해주는 스킬이라고 했는데... 이상하게 발동이 안 됩니다.

## 목표
고장 원인을 찾아 고치고, 에이전트가 `data/regression.log`를 요약하게 하세요.

## 절차 (레시피)
1. 스킬을 설치한 뒤 스킬을 다시 불러옵니다 (opencode: 재시작 / Claude Code: `/reload-skills`):
   - opencode · Linux: `cp -r skills-broken/log-digest .opencode/skills/`
   - opencode · Windows(PowerShell): `Copy-Item -Recurse skills-broken\log-digest .opencode\skills\`
   - Claude Code · Linux: `cp -r skills-broken/log-digest .claude/skills/`
   - Claude Code · Windows(PowerShell): `Copy-Item -Recurse skills-broken\log-digest .claude\skills\`
2. 에이전트에게: **"리그레션 로그 요약해줘"** → 아마 스킬이 발동하지 않을 겁니다
3. 설치한 `SKILL.md`(opencode: `.opencode/skills/log-digest/SKILL.md`, Claude Code: `.claude/skills/log-digest/SKILL.md`)를 열어 **frontmatter의 description을 읽어보세요.** 스킬이 알맞게 작성되어 있나요? 실제로 하는 일(본문)과 같은 얘기를 하고 있나요?
4. description을 고치고, 스킬을 다시 불러온 뒤(opencode: 재시작 / Claude Code: `/reload-skills`) 다시 시켜보세요.
   - Claude Code에서는 고장 난 스킬도 `/log-digest`로 직접 부르면 실행됩니다. 하지만 그것은 수리가 아닙니다 — **자연어 요청으로 발동**해야 성공입니다.

## 성공 조건
- `output/log-digest.md`가 생성되고, assertion / timeout / build / 환경 4개 버킷 분류가 포함될 것

## 검증
- Linux&nbsp;&nbsp;&nbsp;: `./check.sh core-fix-log-digest`
- Windows: `check.bat core-fix-log-digest`  (또는 `check.bat` 더블클릭 후 id 입력 — 창은 결과 확인 후 닫으면 됩니다)

> 💡 핵심 원리: 에이전트는 평소에 description만 보고 스킬을 고를지 결정합니다. 본문은 발동된 뒤에야 읽어요.
