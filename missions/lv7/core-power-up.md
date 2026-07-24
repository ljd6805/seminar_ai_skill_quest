---
id: core-power-up
level: 7
track: core
title: "장인의 한 수 — 스크립트 번들링"
check: script
---

# Lv.7 장인의 한 수 — 스크립트 번들링 ⭐

LLM은 숫자 세기에서 가끔 실수합니다. 장인은 그걸 알기에, 셈은 코드에 맡깁니다.
스킬 폴더에는 SKILL.md 외에 스크립트도 함께 담을 수 있습니다.

## 목표
`test-report` 스킬이 직접 세지 말고, 제공된 `scripts-given/aggregate.py`를 **실행해서**
그 출력으로 `output/test-report-v2.md`를 만들도록 업그레이드하세요.

## 단서
- 스크립트를 스킬 폴더 안으로: `.opencode/skills/test-report/scripts/aggregate.py`
- SKILL.md 본문에 "집계는 반드시 `python3 <스킬폴더>/scripts/aggregate.py data/test_results.csv` 실행 결과를 사용하라"고 지시 (Windows는 보통 `python3` 대신 `python`)
- 스크립트 출력의 `AGG-TOKEN:` 줄까지 리포트에 그대로 포함시키게 하세요 — 이 토큰은 스크립트를 진짜 실행해야만 알 수 있는 값이라, 에이전트가 "직접 센 척"하면 검증에서 걸립니다.

## 성공 조건
- `output/test-report-v2.md`에 올바른 `AGG-TOKEN:` 값이 포함될 것

## 검증
- Linux&nbsp;&nbsp;&nbsp;: `./check.sh core-power-up`
- Windows: `check.bat core-power-up`  (또는 `check.bat` 더블클릭 후 id 입력 — 창은 결과 확인 후 닫으면 됩니다)

<details><summary>힌트 ① </summary>
에이전트가 스크립트를 실행하지 않고 결과를 지어내려 할 수 있습니다. SKILL.md에 "추정하지 말 것, 반드시 실행 결과를 사용할 것"을 명시하는 것도 스킬 작성 기술입니다.
</details>
