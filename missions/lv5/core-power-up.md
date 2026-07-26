---
id: core-power-up
level: 5
track: core
title: "장인의 한 수 — 레퍼런스 번들링"
check: script
---

# Lv.5 장인의 한 수 — 레퍼런스 번들링 ⭐

판정 기준은 자주 바뀝니다. 기준을 SKILL.md 본문에 박아두면, 바뀔 때마다 스킬을 뜯어고쳐야 하죠.
장인은 **절차(본문)와 기준(레퍼런스)을 분리**합니다.
스킬 폴더에는 SKILL.md 외에 기준표·템플릿·체크리스트 같은 참고 자료도 함께 담을 수 있습니다.

## 목표
`test-report` 스킬이 팀 품질 기준서(`reference-given/quality-bar.md`)를 **읽고 판정**하도록 업그레이드해서,
판정이 포함된 `output/test-report-v2.md`를 만들게 하세요.

## 단서 (마지막 단서입니다)
- 기준서를 스킬 폴더 안으로: `.opencode/skills/test-report/references/quality-bar.md`
- SKILL.md 본문에 "판정은 반드시 `references/quality-bar.md` 기준서를 따르고, 리포트에 `GRADE:` 줄과
  기준서의 `REF-VERSION:` 줄을 그대로 포함하라"고 지시하세요
- `REF-VERSION:`은 기준서를 진짜 읽어야만 알 수 있는 값이라, 에이전트가 기준을 "아는 척"하면 검증에서 걸립니다

## 성공 조건
- `output/test-report-v2.md`에 기준서에 따른 올바른 `GRADE:` 값이 포함될 것
- 기준서의 `REF-VERSION:` 줄이 그대로 포함될 것

## 검증
- Linux&nbsp;&nbsp;&nbsp;: `./check.sh core-power-up`
- Windows: `check.bat core-power-up`  (또는 `check.bat` 더블클릭 후 id 입력 — 창은 결과 확인 후 닫으면 됩니다)

<details><summary>힌트 ①</summary>
에이전트가 기준서를 읽지 않고 판정을 지어낼 수 있습니다. SKILL.md에 "추정하지 말 것, 반드시 기준서를 읽고 따를 것"을 명시하는 것도 스킬 작성 기술입니다.
</details>

> 💡 번들할 수 있는 자료는 기준표만이 아닙니다 — 템플릿·체크리스트·용어집, 그리고 스크립트(코드)까지. 오늘은 기준서로 원리를 익힙니다. 다음 레벨은 승급 시험 — 절차 안내가 없습니다.
