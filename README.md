# SKILL QUEST — opencode skill 온보딩 게임

> 작성자: **jdeok.lee** · 버전: **v2.0** (시즌 1 온보딩 + 시즌 2 심화)

> ⚠️ **opencode 전용** 실습입니다. 미션·채점기·스킬 구조 모두 [opencode](https://opencode.ai) 에이전트 기준으로 작성되었습니다.

당신의 opencode 에이전트를 신입에서 고참 동료로 성장시키는 7단계 온보딩 실습 게임입니다.
**시즌 2 (SKILL 심화 — Lv.8~13)** 에서는 그 스킬들을 부품 삼아 **스킬 시스템(라인)** 을 조립합니다.

## 시작하기
1. 이 레포를 clone 하고, 레포 최상위 폴더에서 opencode를 실행하세요.
2. 웹 보드에서 신입 에이전트의 이름을 지어 등록하면 Lv.1 미션이 열립니다.
3. 미션 카드는 `missions/lv1/` 부터 순서대로. (웹 보드에도 동일 내용이 표시됩니다)

## 게임 루프
미션 수행(터미널) → 채점 → 성장 코드 획득 → 웹 보드에 입력 → 레벨업

시즌 1 수업은 **Lv.6 승급 시험까지** 진행하며(통과하면 수료 🎓), **Lv.7은 세미나 후 각자의 업무로 도전하는 자율 퀘스트**입니다.

## 시즌 2 — SKILL 심화 (Lv.8~13)

4편 이론 세미나([SKILL 심화 — 기법 카탈로그](https://github.com/ljd6805/seminar_ai_skill_advanced))의 실습편입니다.
해결 장의 스킬 구성이 그대로 미션 골격이 되며, 3스테이지로 진행합니다 — **부품(Lv.8) → 라인(Lv.9~10) → 검사(Lv.11~12)**, 수료 후 **보스전(Lv.13)** 과 **EX 자율 퀘스트**.

- 전제: 시즌 1 수료(Lv.6). 그때의 리포·스킬을 이어서 씁니다. 리포가 없거나 미수료라면 `skills-given/snapshot-s1/`(시즌 1 세이브 파일)로 같은 출발선에서 시작하세요.
- 보드에서 Lv.6인 참가자는 **Lv.7을 건너뛰고 Lv.8 코드로 바로 입장**할 수 있습니다 (Lv.7은 언제든 자율 도전).
- 미션 카드: `missions/lv8/` ~ `missions/lv13/` + `missions/ex/` · 진행자 자료: `answer-key/` (참가자 스포일러 주의)
- 수업 수료 라인은 **Lv.12 (반박 검증)** — Lv.13 보스전과 EX는 세미나 후의 도전입니다.

## 채점기 실행 (환경별)
- **Linux / SSH**: `./check.sh <mission-id>` — 시즌 2(Lv.8+)는 `./check-adv.sh <mission-id>`
- **Windows**: `check.bat <mission-id>` — 시즌 2는 `check-adv.bat <mission-id>`. 또는 파일을 **더블클릭**하면 미션 목록이 나오고 id를 입력해 채점합니다. 결과 확인 후 아무 키나 누르면 창이 닫힙니다. (PowerShell 내장 기능만 사용하므로 별도 설치 불필요)
- 웹 보드에서 자신의 환경(Linux/Windows)을 선택하면 미션 명령어가 그 환경에 맞게 표시됩니다.

## 폴더 구성
- `board/skill-quest-board.html` — 웹 보드(캐릭터 시트·성장 코드 입력·스킬 도감). 참가자는 안내받은 링크로 접속하며, 이 파일은 배포용 원본입니다. → [웹 보드 바로가기](https://ljd6805.github.io/seminar_ai_skill_quest/board/skill-quest-board.html)
- `doc/slides/index.html` — 실습 전 이론교육 슬라이드(이론 5장 ↔ 실습 7레벨 매핑). 브라우저로 열거나 GitHub Pages로 서빙합니다. → [슬라이드 바로가기](https://ljd6805.github.io/seminar_ai_skill_quest/doc/slides/)
- `missions/` — 레벨별 미션 카드. `core-*`는 시즌 1 공통 트랙, `adv-*`는 시즌 2 심화 트랙. 세미나 후 자기학습용 미션을 자유롭게 추가할 수 있습니다 (md 파일 하나 추가 = 미션 추가).
- `data/` — 미션용 가짜 데이터 (regression 로그, 테스트 결과 CSV, 시즌 2: 주차별 CSV·장애 일별 로그·분석 초안)
- `tools/gen-big-log.py` — 시즌 2 Lv.8용 50만 줄 로그 생성기 (`data/regression-big.log` 생성 — 커밋 금지, .gitignore 처리됨)
- `scripts-given/` — 시즌 2 제공 스크립트 (digest.py · gate.py · validate 뼈대 · 역채점용 불량 견본)
- `skills-given/` — 완성 제공 스킬 (Lv.1 daily-report, 시즌 2 부품 root-cause·report-check, `snapshot-s1/` 시즌 1 세이브 파일)
- `skills-broken/` — 수리 대상 고장 스킬 (Lv.2, Lv.6, 시즌 2 Lv.9)
- `skills-templates/` — 시즌 2 빈칸 템플릿 (incident-flow · refute-check · regression-weekly)
- `reference-given/` — 번들링용 팀 공용 기준서 (Lv.5 품질 판정 기준, Lv.6 코멘트 분류 기준)
- `check.sh` / `check.bat`+`check.ps1` — 시즌 1 채점기 · `check-adv.sh` / `check-adv.bat`+`check-adv.ps1` — 시즌 2 채점기 (통과 시 성장 코드 발급)
- `answer-key/` — 진행자용 답안·리허설 워크스루 (참가자는 열지 마세요)

## 규칙 아닌 규칙
- 막히면 **에이전트에게 물어보세요.** 반칙이 아니라 실무입니다.
- 스킬은 전부 이 레포의 `.opencode/skills/` (프로젝트 스코프)에 설치합니다. 여러분의 전역 설정은 건드리지 않습니다.
