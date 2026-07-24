---
id: core-build-report
level: 3
track: core
title: "첫 제작 — 백지에서 스킬 만들기 (템플릿 제공)"
check: script
---

# Lv.3 첫 제작

이제 직접 만들 차례입니다. 겁먹지 마세요 — 빈칸 채우기에 가깝습니다.

## 목표
`data/test_results.csv`를 읽어 PASS/FAIL 리포트를 만드는 스킬 **`test-report`**를 제작하세요.
(이름은 반드시 `test-report`로 — 이후 레벨에서 이 스킬을 업그레이드합니다)

## 절차 (레시피)
1. 스킬 폴더 생성 후 그 안에 `SKILL.md` 생성:
   - Linux: `mkdir -p .opencode/skills/test-report`
   - Windows(PowerShell): `New-Item -Type Directory -Force .opencode\skills\test-report`
2. 아래 템플릿의 빈칸을 채우세요:

```markdown
---
name: test-report
description: (❓ 어떤 요청에 발동해야 할까요? 사용자가 실제로 할 말을 담으세요)
---

# Test Report Skill

사용자가 테스트 결과 리포트를 요청하면:
1. data/test_results.csv 를 읽는다.
2. (❓ 무엇을 집계할지 적으세요)
3. 결과를 output/test-report.md 로 작성한다. 파일 끝에 반드시
   TOTAL_PASS: <숫자> 와 TOTAL_FAIL: <숫자> 줄을 포함한다.
```

3. opencode 재시작 → **"테스트 결과 리포트 만들어줘"**

## 성공 조건
- `output/test-report.md`에 정확한 `TOTAL_PASS:` / `TOTAL_FAIL:` 값이 포함될 것

## 검증
- Linux&nbsp;&nbsp;&nbsp;: `./check.sh core-build-report`
- Windows: `check.bat core-build-report`  (또는 `check.bat` 더블클릭 후 id 입력 — 창은 결과 확인 후 닫으면 됩니다)

> 💡 성공 조건에 "기계가 읽을 수 있는 형식"을 못박는 것 — 이것도 스킬 설계의 중요한 기술입니다.
