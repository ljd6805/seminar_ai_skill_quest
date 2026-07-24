---
id: core-silent-skill
level: 5
track: core
title: "침묵하는 스킬 — 원인 불명 고장"
check: script
---

# Lv.5 침묵하는 스킬 🥽

`skills-broken/fail-summary` — regression 실패의 근본 원인을 요약해주는 스킬이라고 합니다.
설치하고 요청해봐도... 에이전트가 아무 반응이 없습니다. 이번엔 아무도 원인을 알려주지 않습니다.

## 목표
스킬을 진단하고 고쳐서, 에이전트가 실패 원인 요약(`output/fail-summary.md`)을 만들게 하세요.

## 성공 조건
- `output/fail-summary.md`가 fail-summary 스킬에 의해 생성될 것

## 검증
- Linux&nbsp;&nbsp;&nbsp;: `./check.sh core-silent-skill`
- Windows: `check.bat core-silent-skill`  (또는 `check.bat` 더블클릭 후 id 입력 — 창은 결과 확인 후 닫으면 됩니다)

<details><summary>힌트 ① (편하게 여세요)</summary>
에이전트는 description을 읽고 발동을 결정합니다. description을 소리 내어 읽고, 당신이 방금 입력한 프롬프트와 비교해보세요. 같은 것에 대해 말하고 있나요?
</details>

<details><summary>힌트 ② (원리 리마인드)</summary>
description과 본문이 서로 다른 스킬을 설명하고 있다면, 에이전트는 description 쪽을 믿습니다. 그리고 한글로 일하는 팀이라면 — 사용자가 실제로 칠 한글 표현이 description에 있으면 훨씬 안정적으로 발동합니다.
</details>

<details><summary>힌트 ③ (거의 정답)</summary>
description이 "coverage 분석" 얘기를 하고 있습니다. 이 스킬의 본문은 "regression 실패 원인 요약"이고요. description을 본문이 하는 일에 맞게, 한/영 표현을 함께 넣어 다시 쓰세요. 예: "regression 실패 원인 분석·요약. 리그레션 실패, fail 원인, root cause 요청 시 사용."
</details>
