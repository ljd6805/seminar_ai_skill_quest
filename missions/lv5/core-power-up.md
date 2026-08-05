---
id: core-power-up
level: 5
track: core
title: "장인의 한 수 — 레퍼런스 번들링"
check: script
---

# Lv.5 장인의 한 수 — 레퍼런스 번들링 ⭐

## 상황
팀장이 요청합니다 — "리포트에 **품질 판정**도 넣어줘."
다행히 판정 규칙은 팀 기준서(`reference-given/quality-bar.md`)에 이미 있습니다.
FAIL 개수에 따라 `CLEAN / WATCH / RISK / BLOCK` 등급을 매기는 표죠.

그런데 이 기준은 분기마다 바뀝니다. 표를 SKILL.md 본문에 베껴 적으면,
기준이 바뀔 때마다 스킬도 뜯어고쳐야 하죠. 그래서 이번엔 다르게 갑니다 —
**기준서 파일을 스킬 폴더에 동봉하고, 에이전트가 그 파일을 직접 읽고 판정하게** 만듭니다.
이것이 **레퍼런스 번들링**입니다. (기준표뿐 아니라 템플릿·체크리스트도 이렇게 담을 수 있습니다)

## 목표
`test-report` 스킬을 업그레이드해서, 기준서에 따른 판정(`GRADE:`)이 포함된
`output/test-report-v2.md`를 만들게 하세요.

## 절차 (레시피)
1. 기준서를 스킬 폴더 안으로 복사합니다 (= 번들):
   - Linux: `mkdir -p .opencode/skills/test-report/references && cp reference-given/quality-bar.md .opencode/skills/test-report/references/`
   - Windows(PowerShell): `New-Item -Type Directory -Force .opencode\skills\test-report\references | Out-Null; Copy-Item reference-given\quality-bar.md .opencode\skills\test-report\references\`
2. SKILL.md 본문의 작업절차를 아래 네 가지 지시로 수정합니다:
   - ① **데이터** — 집계 원본은 `data/test_results.csv`를 사용할 것
   - ② **판정** — 판정하기 전에 반드시 스킬 내부의 `references/quality-bar.md`를 **읽고 따를 것** (추측 금지)
   - ③ **출력** — 결과물은 `output/test-report-v2.md`로 저장하고, `GRADE: <판정>` 줄과 기준서의 `REF-VERSION:` 줄을 **그대로 포함**할 것
   - ④ **검토** — 작성한 파일을 다시 읽어 GRADE가 기준표와 맞는지, REF-VERSION이 정확한지 검토하고 틀리면 고칠 것
3. opencode 재시작 → 스킬 발동 → `output/test-report-v2.md` 확인

## 왜 REF-VERSION까지 넣게 하나요?
그 값은 기준서 파일 안에만 적혀 있습니다. 리포트에 정확히 들어 있다면
에이전트가 기준서를 **진짜로 읽었다는 증거**가 되죠. 안 읽고 "아는 척" 판정하면 여기서 걸립니다.

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
