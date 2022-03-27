# 그룹웨어 [I am groupe]
<img src="https://user-images.githubusercontent.com/91956877/159950410-b2c13bb7-44c3-498e-8335-3dd723de6881.png" width="35%" height="25%" title="로고"></img><br>
> ## 프로젝트 개요 📑
> 협업에 필요한 다양한 기능을 제공하고 업무 효율을 높일 수 있는 업무용 소프트웨어인 그룹웨어 구현.
>* 개발기간 : 2022년 01월 18일 ~ 2022년 03월 18일 (구현 : 2월 19일 ~ 3월 16일)
>* 참여인원 : 5명 (김다혜, 박재한, 이유승, 이종훈, 이지은)

<br>
<br>

> ## 구현기능 🛠 
 #### [본인 파트]
* 메인페이지(사이드메뉴바, 게시판, 캘린더)
* 로그인(아이디 저장 / 자동 로그인)
* 연차 관리 (연차생성 / 연차 및 휴가 사용대장 / 연차정산 / 사원 조정 연차 관리 / 휴가 종류 발생 / 사용촉구서 / 간이 정보 게시판)
* 일정 관리 (캘린더별 일정 등록 및 수정, 삭제)
* 게시판 (공지사항, 자유게시판)
 ---------------------------------------------------------------------------------------------------------------------
 #### [그 외 부분]
* 근태 관리
* 인사 관리
* 전자 결재 관리
* 예약 관리
* 실시간 채팅

<br>
<br>

> ## 개발환경 🖥 
>* Front-End : Bootstrap, JavaScript, HTML5, CSS3, jQuery, Ajax
>* Back-End : JDK 1.8, Java, Spring 3, MyBatis
>* DBMS : Oracle Database 11g
>* Server : Tomcat 8.5
>* Tools : Eclipse IDE
<br>
<br>

> ## 동작과정🎐 <br>
<img src="https://user-images.githubusercontent.com/91956877/160278685-b93a0c6a-b99a-4952-991e-eb716c8086d0.PNG" width="65%" height="60%" title="스프링 동작과정"></img>_[참조1](https://galid1.tistory.com/503)_<br>

1. 클라이언트의 요청이 Controller의 Handler에 도달하기 전에 CookieInterceptor나 LoginInterceptor를 거쳐 로그인의 여부를 체크한다.
2. Interceptor들을 통과하면 DispatcherServlet은 HandlerMapping에게 요청을 전달하고 알맞는 Controller를 찾는다.
3. Controller는 요청을 처리하고 HandlerAdapter에게 처리결과를 보낸다.
    * 처리과정
    1. Controller에서 RequestMapping()을 통해 알맞은 액션이 실행되고 비즈니스 로직을 처리하고 Service에게 넘겨준다.
    2. Service에선 Controller로부터 받은 데이터를 보관, 수정, 삭제를 위해 DTO에게 데이터를 넘겨준다.
    3. .xml파일에서 Mybatis와 DB 연결하고 DTO와 연결해준다.
    4. DTO로부터 SQL문을 읽고 데이터를 처리하고 그 결과를 다시 Service를 거쳐 Controller로 보낸다.
    5. Controller는 결과에 맞게 데이터를 렌더링한다.
4. HandlerAdapter받은 결과를 ModelAndView 형태의 Model을 파라미터를 DispatcherServlet에게 전달한다.
5. DispatcherServlet은  viewresolver를 통해 알맞는 view를 찾아 렌더링된 페이지를 response로 사용자에게 리턴한다.
