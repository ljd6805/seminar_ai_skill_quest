# SKILL QUEST — opencode skill 온보딩 게임

> 작성자: **jdeok.lee** · 버전: **v1.0**

> ⚠️ **opencode 전용** 실습입니다. 미션·채점기·스킬 구조 모두 [opencode](https://opencode.ai) 에이전트 기준으로 작성되었습니다.

당신의 opencode 에이전트를 신입에서 고참 동료로 성장시키는 7단계 온보딩 실습 게임입니다.

## 시작하기
1. 이 레포를 clone 하고, 레포 최상위 폴더에서 opencode를 실행하세요.
2. 웹 보드에 닉네임을 등록하면 Lv.1 미션이 열립니다.
3. 미션 카드는 `missions/lv1/` 부터 순서대로. (웹 보드에도 동일 내용이 표시됩니다)

## 게임 루프
미션 수행(터미널) → 채점 → 성장 코드 획득 → 웹 보드에 입력 → 레벨업

## 채점기 실행 (환경별)
- **Linux / SSH**: `./check.sh <mission-id>`
- **Windows**: `check.bat <mission-id>` — 또는 `check.bat`를 **더블클릭**하면 미션 목록이 나오고 id를 입력해 채점합니다. 결과 확인 후 아무 키나 누르면 창이 닫힙니다. (PowerShell 내장 기능만 사용하므로 별도 설치 불필요, Lv.7만 Python 필요)
- 웹 보드에서 자신의 환경(Linux/Windows)을 선택하면 미션 명령어가 그 환경에 맞게 표시됩니다.

## 폴더 구성
- `board/skill-quest-board.html` — 웹 보드(캐릭터 시트·성장 코드 입력·스킬 도감). 참가자는 안내받은 링크로 접속하며, 이 파일은 배포용 원본입니다. → [웹 보드 바로가기](https://ljd6805.github.io/seminar_ai_skill_quest/board/skill-quest-board.html)
- `doc/slides/index.html` — 실습 전 이론교육 슬라이드(이론 5장 ↔ 실습 7레벨 매핑). 브라우저로 열거나 GitHub Pages로 서빙합니다. → [슬라이드 바로가기](https://ljd6805.github.io/seminar_ai_skill_quest/doc/slides/)
- `missions/` — 레벨별 미션 카드. `core-*`는 세미나 공통 트랙이며, 세미나 후 자기학습용 미션을 자유롭게 추가할 수 있습니다 (md 파일 하나 추가 = 미션 추가).
- `data/` — 미션용 가짜 데이터 (regression 로그, 테스트 결과 CSV)
- `skills-given/` — Lv.1용 완성 스킬
- `skills-broken/` — 수리 대상 고장 스킬 (Lv.2, Lv.5)
- `scripts-given/` — Lv.7 번들링용 집계 스크립트
- `check.sh` / `check.bat`+`check.ps1` — 미션 채점기, Linux/Windows용 (통과 시 성장 코드 발급)

## 규칙 아닌 규칙
- 막히면 **에이전트에게 물어보세요.** 반칙이 아니라 실무입니다.
- 스킬은 전부 이 레포의 `.opencode/skills/` (프로젝트 스코프)에 설치합니다. 여러분의 전역 설정은 건드리지 않습니다.
