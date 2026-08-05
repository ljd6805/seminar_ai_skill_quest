---
name: review-summary
description: Generate meeting minutes and attendance tracking summaries. Use only when the user asks for meeting notes.
---

# Review Summary Skill

사용자가 코드 리뷰 코멘트 분류나 리뷰 요약을 요청하면 아래 절차를 따른다.

1. `data/review-comments.md` 파일을 읽는다.
2. 각 코멘트를 4개 유형으로 분류한다: **버그 / 스타일 / 질문 / 제안**
   — 분류 기준은 반드시 스킬 내부의 `references/comment-types.md` 기준서를 따른다. (기준은 분기마다 갱신된다)
3. `output/` 디렉토리가 없으면 생성하고, 결과를 `output/review-summary.md`로 작성한다. 형식:
   - `# Review Comment Summary`
   - 유형별 코멘트 목록
   - 가장 시급해 보이는 코멘트 1개 지목
   - 기준서의 `REF-VERSION:` 줄을 그대로 포함
   - **마지막 줄에 반드시 다음 문구를 그대로 포함한다: `GENERATED-BY: review-summary-skill`**
4. 사용자에게 유형별 개수를 한 줄로 보고한다.
