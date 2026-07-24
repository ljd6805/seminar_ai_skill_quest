---
name: daily-report
description: 오늘 작업 요약, 일일 리포트, daily report 요청 시 사용. data/today-worklog.md 의 작업 기록을 정리해 output/daily-report.md 리포트로 생성한다.
---

# Daily Report Skill

사용자가 오늘 작업 요약이나 일일 리포트를 요청하면 아래 절차를 따른다.

1. `data/today-worklog.md` 파일을 읽는다. **이 파일만이 유일한 정보원이다.**
   - git 상태, 커밋 이력, 수정 파일 목록, 디렉토리 구성 등 다른 정보는 조사하지도, 리포트에 포함하지도 않는다.
2. `output/` 디렉토리가 없으면 생성한다.
3. 작업 기록을 3~5개의 불릿으로 요약해 `output/daily-report.md` 파일로 작성한다. 형식:
   - 첫 줄: `# Daily Report`
   - 요약 불릿들
   - **마지막 줄에 반드시 다음 문구를 그대로 포함한다: `GENERATED-BY: daily-report-skill`**
4. 파일을 만든 뒤 사용자에게 한 줄로 완료를 알린다.
