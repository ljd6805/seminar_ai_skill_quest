---
id: core-silent-skill
level: 6
track: core
title: "침묵하는 스킬 — 승급 시험"
check: script
---

# Lv.6 침묵하는 스킬 — 승급 시험 🥽

## 상황
전임자가 리뷰 코멘트(`data/review-comments.md`)를 정리해주던 스킬을 남기고 떠났습니다.
팀 레포의 `skills-broken/review-summary`에 있다고 합니다. 인수인계 문서에는 한 줄뿐이네요 —

> "몇 군데 손볼 곳이 있음. — 전임자"

설치하고 **"리뷰 코멘트 분류해서 요약해줘"** 라고 시켜보세요.
지금까지 배운 **모든 것이 시험 범위**입니다. 여기가 수업의 마지막 관문 — 통과하면 수료입니다. 🎓

스킬 위치: `skills-broken/review-summary` — 절차 안내는 없습니다.

💭 description을 다시 쓰게 된다면 — "요약"이라는 단어, `log-digest`와 겹치지 않을까요? 방어선을 기억하세요.

## 성공 조건
- `output/review-summary.md`가 review-summary 스킬로 생성될 것
- 리포트 끝에 아래 4줄이 포함될 것 (개수 포함):

```
TYPE_BUG: <개수>
TYPE_STYLE: <개수>
TYPE_QUESTION: <개수>
TYPE_SUGGEST: <개수>
```

- 본문이 참조하는 **분류 기준서**가 스킬 폴더에 동봉되고, 기준서의 `REF-VERSION:` 줄이 리포트에 포함될 것

## 검증
- Linux&nbsp;&nbsp;&nbsp;: `./check.sh core-silent-skill`
- Windows: `check.bat core-silent-skill`  (또는 `check.bat` 더블클릭 후 id 입력 — 창은 결과 확인 후 닫으면 됩니다)

<details><summary>힌트 ① (편하게 여세요)</summary>
이론의 진단 체크리스트를 순서대로 밟으세요. 첫 항목은 **위치와 파일명**입니다 — 스킬이 목록에 보이기는 하나요?
</details>

<details><summary>힌트 ② (원리 리마인드)</summary>
목록에는 있는데 침묵한다면, 이제 description 차례입니다. description을 읽어보세요 — 본문과 같은 일을, 사용자가 실제로 칠 표현(한글 포함)으로 말하고 있나요?
</details>

<details><summary>힌트 ③ (형식 점검)</summary>
발동은 되는데 채점에서 탈락한다면 — 성공 조건의 TYPE_ 4줄을 **본문이 지시**하고 있는지 보세요. 출력 형식은 확률에 맡기지 않고, 본문에 직접 못박는 것이었죠 (Lv.3).
</details>

<details><summary>힌트 ④ (마지막 겹)</summary>
본문이 참조하는 파일이 정말 그 자리에 있나요? 전임자는 분류 기준서를 팀 공용 서랍(`reference-given/`)에 두고 갔습니다 — 번들을 기억하세요 (Lv.5).
</details>

> 💡 막히면 에이전트에게 물어보세요. 반칙이 아니라 실무입니다.
