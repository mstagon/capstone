<!-- 포트폴리오 저장소 내 문서입니다. 실제 레포 README로 옮길 땐 이미지 경로를 조정하세요. -->

# 🌿 휴림 (Rest Forest)

> 현대인의 작은 휴식처,

<div style="display: flex; justify-content: center; gap: 16px;">
  <img src="https://github.com/user-attachments/assets/0d7e672f-daea-4738-b3eb-95e880b1a187" width="350" alt="휴림 대표 이미지(발표자료)" />
  <img src="https://github.com/user-attachments/assets/d16468c8-c38f-405f-bfec-b9e2e61e20e2" width="350" alt="휴림 네이밍(발표자료)" />
</div>

---

## 👥 팀원 소개

> 팀원 정보는 **추가 예정**입니다.

| <img src="[팀원1 이미지]" width="150"/>                                                                                                          | <img src="[팀원2 이미지]" width="150"/>                                                                                                          | <img src="[팀원3 이미지]" width="150"/>                                                                                                          | <img src="[팀원4 이미지]" width="150"/>                                                                                                          |
| ------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| 팀원1 이름                                                                                                                                       | 팀원2 이름                                                                                                                                       | 팀원3 이름                                                                                                                                       | 팀원4 이름                                                                                                                                       |
| <a href="[GitHub URL]" target="_blank"><img src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white"/></a> | <a href="[GitHub URL]" target="_blank"><img src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white"/></a> | <a href="[GitHub URL]" target="_blank"><img src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white"/></a> | <a href="[GitHub URL]" target="_blank"><img src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white"/></a> |

---

## 🎬 프로젝트 개요

### 01. 프로젝트 주제

> 케이스 거치(NFC)로 타이머가 시작되는 **디지털 디톡스 앱**

### 02. 프로젝트 소개

스마트폰을 케이스에 거치하면 NFC로 인식해 타이머가 시작됩니다. 사용하지 않은 시간에 따라 가상 식물이 성장하고 포인트를 쌓는 기본 루프를 구성했습니다.

<details>
<summary>🟢 발표자료: 개발배경 및 동기</summary>

![개발배경 및 동기](https://github.com/user-attachments/assets/9081add2-a65c-4b04-ae2a-e99eb124803a)

</details>

- **NFC**: 태그 인식 시 타이머 시작
- **백그라운드 타이머**: 앱이 백그라운드/종료 상태여도 시간 누적(Background Service)
- **게임화**: 시간 기반 식물 성장 + 포인트
- **상점/저장**: 포인트로 아이템 구매, 구매 상태는 Secure Storage 저장
- **상태 관리**: Provider로 타이머/포인트/구매 상태 분리

### 03. 프로젝트 필요성

- **“사용하지 않는 시간” 측정**
  - 디지털 디톡스는 의지만으로 유지하기 어려워, 하드웨어(NFC)로 측정/시작 트리거를 만들었습니다.

<details>
<summary>🟢 발표자료: 목표 및 필요성</summary>

![목표 및 필요성](https://github.com/user-attachments/assets/78166518-da17-4a31-932d-f88f1ebdb448)

</details>

### 04. 주요 기능

- **NFC 인식 → 타이머 자동 시작**
- **백그라운드 누적 + 재실행 시 상태 복원**
- **식물 성장 단계 계산(실시간 UI 업데이트)**
- **포인트/상점/구매 상태 영속화(Secure Storage)**

---

## 🟢 프로젝트 소개(발표자료)

<details>
<summary>주요 기능/작동 흐름/디버그/차별점 보기</summary>

![주요기능1](https://github.com/user-attachments/assets/67d09d0b-2c49-477a-a1fa-495fb8cc4cd0)
![작동흐름](https://github.com/user-attachments/assets/cfe29717-2c51-40bd-88df-2b6764fe14c2)
![디버그](https://github.com/user-attachments/assets/27db0ffa-ccd8-4648-b954-f7152638d5d1)
![유사 서비스와 차별점 1](https://github.com/user-attachments/assets/7f1efcfe-5844-4c96-b319-9e98e5eeb236)

</details>

---

## 🟢 차별화 전략(발표자료)

<details>
<summary>활용방안/기대효과/시장성/발전가능성 보기</summary>

![유사 서비스와 차별점 1](https://github.com/user-attachments/assets/7f1efcfe-5844-4c96-b319-9e98e5eeb236)
![활용방안](https://github.com/user-attachments/assets/734acb58-e238-4808-8fa2-c01b1f6f5a4b)
![기대효과](https://github.com/user-attachments/assets/3d327d7e-acf4-4370-9755-3ffba80b4b8e)
![시장성 및 판매가치](https://github.com/user-attachments/assets/5a2ce2cd-ccb8-42f1-bb3a-71d79c1ded95)
![발전가능성](https://github.com/user-attachments/assets/ac761f3d-a331-46ec-a191-7b1c516797b2)

</details>

---

## 📷 주요 화면

> 화면 GIF/스크린샷은 **추가 예정**입니다.

---

## ⚙️ 기술 스택

<img src="https://skillicons.dev/icons?i=flutter&perline=8" />

### Frontend (App)

- **Flutter**, Dart
- **Provider**
- NFC Manager
- Flutter Background Service
- Flutter Secure Storage

### Hardware / 기타

- NFC 태그(케이스 내장) 연동

---

## 🌐 서버 정보

- **서버**: 없음(클라이언트 중심)

---

## 🗓️ WBS / 요구사항 / ERD / DDL / DML

> 문서화 자료는 **추가 예정**입니다.

---

## ⚙️ 로컬 실행 방법

### 1. 레포지토리 클론

```bash
git clone https://github.com/mstagon/Rest_Forest_Client
cd Rest_Forest_Client
```

### 2. 실행

- **추가 예정** (Flutter run, NFC/백그라운드 권한 설정 포함)

---

## 🎉 회고

NFC 인식, 백그라운드 타이머처럼 모바일 OS 제약이 큰 영역을 직접 다뤄본 프로젝트였습니다.  
다음에는 백그라운드 동작의 배터리/권한 이슈를 더 보수적으로 다루고, 기록/통계 같은 “지속 사용” 요소를 보강해보고 싶습니다.

---

## 📄 라이선스

- 미정 (추가 예정)

---

## 📞 문의

- **Email**: devcms21@gmail.com
- **Portfolio**: https://devcms.me/projects/rest-forest
