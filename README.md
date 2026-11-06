# SKILL QUEST — opencode skill 온보딩 게임

> 작성자: **jdeok.lee** · 버전: **v1.0**

> ✅ **opencode와 Claude Code를 모두 지원**합니다. 원래 [opencode](https://opencode.ai) 기준으로 만든 실습이며, [Claude Code](https://code.claude.com)에서도 같은 미션·채점기로 스터디할 수 있습니다. 두 에이전트의 차이는 아래 [에이전트별 차이](#에이전트별-차이-opencode--claude-code) 표에 정리했습니다.

당신의 코딩 에이전트(opencode 또는 Claude Code)를 신입에서 고참 동료로 성장시키는 7단계 온보딩 실습 게임입니다.

## 시작하기
1. 이 레포를 clone 하고, 레포 최상위 폴더에서 에이전트를 실행하세요. (`opencode` 또는 `claude`)
2. 웹 보드 등록 화면에서 **작업 환경(Linux/Windows)과 하네스(opencode/Claude Code)를 고르고**, 신입 에이전트의 이름을 지어 등록하면 Lv.1 미션이 열립니다. 하네스는 기본값 없이 반드시 골라야 하며, 고른 하네스에 맞춰 Lv.1부터 미션 절차가 따로 표시됩니다. (진행 중에는 캐릭터 시트에서 바꿀 수 있고, 레벨은 유지됩니다)
3. 미션 카드는 `missions/lv1/` 부터 순서대로. (웹 보드에도 동일 내용이 표시됩니다)

## 게임 루프
미션 수행(터미널) → 채점 → 성장 코드 획득 → 웹 보드에 입력 → 레벨업

세미나 수업은 **Lv.6 승급 시험까지** 진행하며(통과하면 수료 🎓), **Lv.7은 세미나 후 각자의 업무로 도전하는 자율 퀘스트**입니다.

## 채점기 실행 (환경별)
- **Linux / SSH**: `./check.sh <mission-id>`
- **Windows**: `check.bat <mission-id>` — 또는 `check.bat`를 **더블클릭**하면 미션 목록이 나오고 id를 입력해 채점합니다. 결과 확인 후 아무 키나 누르면 창이 닫힙니다. (PowerShell 내장 기능만 사용하므로 별도 설치 불필요)
- 웹 보드에서 자신의 환경(Linux/Windows)과 에이전트(opencode/Claude Code)를 선택하면 미션 명령어가 그에 맞게 표시됩니다.
- 채점기는 `.opencode/skills/`와 `.claude/skills/` 중 존재하는 폴더를 **자동 감지**합니다. 두 폴더가 모두 있으면 둘 다 확인합니다. 한쪽으로 고정하려면 `QUEST_AGENT=claude ./check.sh <id>` (Windows PowerShell: `$env:QUEST_AGENT="claude"; .\check.bat <id>`)처럼 지정하세요.

## 에이전트별 차이 (opencode ↔ Claude Code)

| 항목 | opencode | Claude Code |
|---|---|---|
| 실행 | 레포 최상위에서 `opencode` | 레포 최상위에서 `claude` |
| 스킬 설치 위치 (프로젝트 스코프) | `.opencode/skills/<이름>/SKILL.md` | `.claude/skills/<이름>/SKILL.md` |
| 스킬을 넣거나 고친 뒤 | opencode **재시작** | 대화창에서 **`/reload-skills`** 실행 |
| 설치된 스킬 목록 확인 | 에이전트에게 스킬 목록 질문 | **`/skills`** |
| 발동 확인 | 산출물의 `GENERATED-BY` 서명 | 산출물의 `GENERATED-BY` 서명 + 대화창의 `Skill(이름)` 표시 |

Claude Code를 쓸 때 주의할 점이 두 가지 있습니다.
- Claude Code는 스킬 폴더의 변경을 세션 도중에도 감지합니다. 다만 **세션을 시작할 때 없던 `.claude/skills` 폴더는 감시하지 않으므로**, 이 레포처럼 실습 중에 폴더를 처음 만드는 경우에는 스킬을 넣거나 고칠 때마다 `/reload-skills`를 실행해야 합니다. 미션 카드의 "재시작"은 Claude Code에서 `/reload-skills`로 읽으면 됩니다. (세션을 새로 시작해도 됩니다)
- Claude Code에서는 `/log-digest`처럼 **슬래시로 스킬을 직접 호출**할 수 있고, 이 경로는 description과 상관없이 스킬을 실행합니다. 이 게임은 에이전트가 description을 보고 스킬을 **스스로 골라 발동**하는지 시험하므로, 미션 요청은 반드시 **자연어로** 하세요.

## 폴더 구성
- `board/skill-quest-board.html` — 웹 보드(캐릭터 시트·성장 코드 입력·스킬 도감). 참가자는 안내받은 링크로 접속하며, 이 파일은 배포용 원본입니다. → [웹 보드 바로가기](https://ljd6805.github.io/seminar_ai_skill_quest/board/skill-quest-board.html)
- `doc/slides/index.html` — 실습 전 이론교육 슬라이드(이론 5장 ↔ 실습 7레벨 매핑). 브라우저로 열거나 GitHub Pages로 서빙합니다. → [슬라이드 바로가기](https://ljd6805.github.io/seminar_ai_skill_quest/doc/slides/)
- `missions/` — 레벨별 미션 카드. `core-*`는 세미나 공통 트랙이며, 세미나 후 자기학습용 미션을 자유롭게 추가할 수 있습니다 (md 파일 하나 추가 = 미션 추가).
- `data/` — 미션용 가짜 데이터 (regression 로그, 테스트 결과 CSV)
- `skills-given/` — Lv.1용 완성 스킬
- `skills-broken/` — 수리 대상 고장 스킬 (Lv.2, Lv.6)
- `reference-given/` — 번들링용 팀 공용 기준서 (Lv.5 품질 판정 기준, Lv.6 코멘트 분류 기준)
- `check.sh` / `check.bat`+`check.ps1` — 미션 채점기, Linux/Windows용 (통과 시 성장 코드 발급)

## 규칙 아닌 규칙
- 막히면 **에이전트에게 물어보세요.** 반칙이 아니라 실무입니다.
- 스킬은 전부 이 레포의 프로젝트 스코프(opencode: `.opencode/skills/`, Claude Code: `.claude/skills/`)에 설치합니다. 여러분의 전역 설정(`~/.claude/skills/` 등)은 건드리지 않습니다.
