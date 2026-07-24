---
id: core-silent-skill
level: 5
track: core
title: "침묵하는 스킬 — 원인 불명 고장"
check: script
---

# Lv.5 침묵하는 스킬 🥽

## 상황
리뷰 코멘트가 잔뜩 쌓였습니다 (`data/review-comments.md`). 회의 전에 유형별로 정리해야 합니다.
팀 레포에 마침 그런 일을 해주는 스킬이 있다고 해서 설치했습니다:

- Linux: `cp -r skills-broken/review-summary .opencode/skills/`
- Windows(PowerShell): `Copy-Item -Recurse skills-broken\review-summary .opencode\skills\`

그런데 — opencode를 재시작하고 **"리뷰 코멘트 분류해서 요약해줘"** 라고 시켜도 스킬이 사용되지 않습니다.
프롬프트에는 문제가 없습니다. 이번엔 아무도 원인을 알려주지 않습니다.

## 목표
스킬을 진단하고 고쳐서, 에이전트가 리뷰 코멘트 요약(`output/review-summary.md`)을 만들게 하세요.

## 성공 조건
- `output/review-summary.md`가 review-summary 스킬에 의해 생성될 것

## 검증
- Linux&nbsp;&nbsp;&nbsp;: `./check.sh core-silent-skill`
- Windows: `check.bat core-silent-skill`  (또는 `check.bat` 더블클릭 후 id 입력 — 창은 결과 확인 후 닫으면 됩니다)

<details><summary>힌트 ① (편하게 여세요)</summary>
에이전트는 description을 읽고 발동을 결정합니다. description을 읽어보세요. 스킬이 알맞게 작성되어 있나요? 방금 입력한 프롬프트와 비교해보세요.
</details>

<details><summary>힌트 ② (원리 리마인드)</summary>
description과 본문이 서로 다른 스킬을 설명하고 있다면, 에이전트는 description 쪽을 믿습니다. 그리고 한글로 일하는 팀이라면 — 사용자가 실제로 칠 한글 표현이 description에 있으면 훨씬 안정적으로 발동합니다.
</details>

<details><summary>힌트 ③ (거의 정답)</summary>
description이 영어로 "회의록(meeting minutes)" 얘기를 하고 있습니다. 이 스킬의 본문은 "리뷰 코멘트 분류·요약"이고요. description을 본문이 하는 일에 맞게, 한/영 표현을 함께 넣어 다시 쓰세요. 예: "코드 리뷰 코멘트를 유형별로 분류·요약. 리뷰 코멘트, review comment 정리 요청 시 사용."
</details>
