---
id: core-scope-guard
level: 4
track: core
title: "범위 조절 — 관찰과 방어선"
check: interactive
---

# Lv.4 범위 조절 — 관찰과 방어선

스킬이 여러 개 설치된 지금, 에이전트는 요청이 올 때마다 description들을 비교해
"이 일은 누가 맡을 일인가"를 정합니다. **당신이 쓴 description이 그 판단의 재료입니다.**

## 목표
스킬 라우팅을 관찰하고, `test-report`에 오발동 방어선을 치세요.

## 절차 (마지막 레시피)
1. 두 요청을 에이전트에게 시켜보고, 각각 **어느 스킬이 맡는지** 관찰하세요:
   - A. "테스트 결과 리포트 만들어줘" → `test-report`가 처리해야 정상 ✅
   - B. "오늘 일정을 리포트로 정리해줘" → `daily-report`가 처리해야 정상 ✅
     ("리포트"라는 단어만 보고 `test-report`가 낚이면 오발동입니다)
2. 아마 B는 daily-report가 잘 맡을 겁니다 — description 비교 라우팅이 작동한 거죠.
   하지만 팀 스킬이 30개로 늘면 이 경쟁은 훨씬 복잡해집니다.
3. **미래의 오발동에 보험 걸기**: `test-report`의 description에 *무엇에는 쓰지 않는지*를 추가하세요.
   예: "...테스트 결과 CSV 집계 전용. 일정 브리핑 등 다른 리포트 작성에는 사용하지 않음."
4. opencode 재시작 후 A가 여전히 잘 발동하는지 확인하세요.

## 성공 조건
- A/B가 각각 올바른 스킬로 라우팅될 것 (직접 확인)
- `test-report`의 description이 Lv.3 이후 실제로 수정되었을 것 — **채점기가 파일로 검증합니다**

## 검증
- Linux&nbsp;&nbsp;&nbsp;: `./check.sh core-scope-guard`
- Windows: `check.bat core-scope-guard`  (또는 `check.bat` 더블클릭 후 id 입력 — 창은 결과 확인 후 닫으면 됩니다)

> 💡 다음 레벨(Lv.5)은 단서만 드리는 마지막 가이드입니다. Lv.6 승급 시험부터는 절차 안내가 없습니다 — 지금까지 배운 원리로 스스로 진단하세요.
