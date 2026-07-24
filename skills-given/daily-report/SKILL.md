---
name: daily-report
description: 오늘 작업 요약, 일일 리포트, daily report 요청 시 사용. 현재 프로젝트의 상태를 정리해 output/daily-report.md 파일로 생성한다.
---

# Daily Report Skill

사용자가 오늘 작업 요약이나 일일 리포트를 요청하면 아래 절차를 따른다.

1. `output/` 디렉토리가 없으면 생성한다.
2. 현재 프로젝트 디렉토리의 파일 구성을 훑어보고, 오늘 다룬 내용을 3~5개의 불릿으로 요약한다.
3. 결과를 `output/daily-report.md` 파일로 작성한다. 형식:
   - 첫 줄: `# Daily Report`
   - 요약 불릿들
   - **마지막 줄에 반드시 다음 문구를 그대로 포함한다: `GENERATED-BY: daily-report-skill`**
4. 파일을 만든 뒤 사용자에게 한 줄로 완료를 알린다.
