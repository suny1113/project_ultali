# project_ultali

- 학원에서 진행한 파이널 프로젝트
- 모임에 가입할 수 있는 취미 모임 웹 서비스 제작
- Spring MVC로 구현

# 개발도구 및 환경
![project01](./images/project01.png)<br>
![project02](./images/project02.png)<br>
![project03](./images/project03.png)<br>
![project04](./images/project04.png)

- Trello로 프로젝트 문서관리
- UI설계는 카카오 OVEN 이용
- 정규화를 통한 ERD 작성

# 개발일정
|기간|작업내용|
|----------------------------|-----------------------|
|프로젝트 주제 선정 및 요구분석| 12월19일 ~ 12월 24일|
|UI 및 DB설계| 12월 24일 ~ 1월 1일|
|역할분담 및 프로그래밍 작업| 1월2일 ~ 1월 14일|
|페이지통합, 디버깅 및 발표준비| 1월 12일 ~ 1월 19일|

- 프로젝트는 총 5주간의 기간에 걸쳐 진행되었다.

# 조원 및 분담
|조원|역할|
|----|----|
|안희선(조장)|로그인, 아이디/비밀번호 찾기|
|박승수|메인페이지 및 관리자페이지|
|안다훈|모임관련기능1|
|전하원|모임관련기능2|
|하진원|마이페이지|
|정연일|회원가입 및 고객센터|

# 내가 맡은 역할
- Spring Security를 이용한 커스텀로그인 구현
- 쿠키를 사용한 아이디 저장기능, Spring Security의 remember-me 기능을 이용한 자동로그인 구현
- 전화번호 인증을 통한 아이디/비밀번호 찾기 구현

## 아이디 저장
[아이디 저장 - 자바스크립트로 구현(16~54번째 줄)](src/main/webapp/views/login/login.jsp)

### 아이디 저장 체크박스 클릭 후 로그인 시 쿠키가 생성되고, 체크박스 해제 후 로그인 시 쿠키가 삭제된다.
![아이디저장](https://user-images.githubusercontent.com/76865340/150294858-31bf1628-c950-469d-ba96-859f4fc0021e.gif)

## 자동로그인
[코드(138~141번째 줄)](src/main/webapp/views/login/login.jsp)<br>
[설정코드(44번째 줄)](src/main/webapp/WEB-INF/spring/security-context.xml)

### 로그인 기억 체크박스 클릭 후 로그인 시 웹 브라우저를 닫았다 열어도 로그인이 유지됨.
![자동로그인](https://user-images.githubusercontent.com/76865340/150295082-36a03325-12b8-46ae-a6b5-ac76110bddc3.gif)

## 아이디 찾기
[아이디 찾기 -인증번호 (58~73번째 줄)](src/main/java/kr/co/jhta/ultali/controller/LoginController.java)<br>
[아이디 찾기 - 결과 (94~110번째 줄)](src/main/java/kr/co/jhta/ultali/controller/LoginController.java)

### 이름과 전화번호 입력 시 인증번호를 받을 수 있고 3분 이내에 입력해야 함.
![아이디찾기](https://user-images.githubusercontent.com/76865340/150295251-52271d88-e970-4845-8939-b5106457f0ce.gif)

## 비밀번호 찾기
[비밀번호 찾기 - 인증번호(75~90번째 줄)](src/main/java/kr/co/jhta/ultali/controller/LoginController.java)<br>
[비밀번호 찾기 - 비밀번호 변경(113~137번째 줄)](src/main/java/kr/co/jhta/ultali/controller/LoginController.java)

### 아이디, 이름, 비밀번호 입력 시 인증번호를 받을 수 있고 3분 이내에 입력해야 함.
![비밀번호찾기](https://user-images.githubusercontent.com/76865340/150295318-3e185019-8f30-4705-8d43-70f84dcefda7.gif)

