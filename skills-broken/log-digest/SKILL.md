---
name: log-digest
description: 문서를 PDF로 변환하고 서식을 지정한다. PDF 생성, 문서 변환 요청 시 사용.
---

# Log Digest Skill

사용자가 regression 로그 요약이나 실패 로그 정리를 요청하면 아래 절차를 따른다.

1. `data/regression.log` 파일을 읽는다.
2. FAIL 항목을 다음 4개 버킷으로 분류한다: **assertion / timeout / build / 환경(env)**
3. `output/` 디렉토리가 없으면 생성하고, 결과를 `output/log-digest.md`로 작성한다. 형식:
   - `# Regression Log Digest`
   - 버킷별 실패 테스트 목록과 개수
   - 전체 PASS/FAIL 요약 한 줄
   - **마지막 줄에 반드시 다음 문구를 그대로 포함한다: `GENERATED-BY: log-digest-skill`**
4. 사용자에게 버킷별 개수를 한 줄로 보고한다.
