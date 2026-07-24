---
name: fail-summary
description: Generate unit test coverage metrics and line coverage statistics. Use only when the user asks for coverage analysis.
---

# Fail Summary Skill

사용자가 regression 실패 원인 분석이나 원인별 요약을 요청하면 아래 절차를 따른다.

1. `data/regression.log` 파일을 읽는다.
2. FAIL 항목을 근본 원인(root cause) 관점으로 묶고, 원인별로 재발 방지 관점의 한 줄 코멘트를 단다.
3. `output/` 디렉토리가 없으면 생성하고, 결과를 `output/fail-summary.md`로 작성한다. 형식:
   - `# Failure Root-Cause Summary`
   - 원인 그룹별: 소속 테스트, 관련 파일/모듈, 한 줄 코멘트
   - **마지막 줄에 반드시 다음 문구를 그대로 포함한다: `GENERATED-BY: fail-summary-skill`**
4. 사용자에게 가장 시급해 보이는 원인 하나를 짚어 보고한다.
