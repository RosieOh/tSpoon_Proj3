<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <style>
        /* Google web font CDN*/
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap');

        *{
            box-sizing: border-box; /*전체에 박스사이징*/
            outline: none; /*focus 했을때 테두리 나오게 */
        }

        body{
            font-family: 'Noto Sans KR', sans-serif;
            font-size:14px;
            background-color: #f5f6f7;
            line-height: 1.5em;
            color : #222;
            margin: 0;
        }
        .h1 {
            padding-top:36px;
            padding-bottom:20px;
            text-align: center;
        }

        a{
            text-decoration: none;
            color: #222;
        }

        /*member sign in*/
        .member{
            width: 400px;
            /* border: 1px solid #000; */
            margin: auto; /*중앙 정렬*/
            padding: 0 20px;
            margin-bottom: 20px;
        }

        .member .logo{
            /*로고는 이미지라 인라인 블록이니까 마진 오토 안됨 블록요소만 됨 */
            display: block;
            margin :50px auto;
        }

        .member .field{
            margin :5px 0; /*상하로 좀 띄워주기*/
        }

        .member b{
            /* border: 1px solid #000; */
            display: block; /*수직 정렬하기 */
            margin-bottom: 5px;
        }

        /*input 중 radio 는 width 가 100%면 안되니까 */
        .member input:not(input[type=radio]),.member select{
            border: 1px solid #dadada;
            padding: 15px;
            width: 100%;
            margin-bottom: 5px;
            height: 100%;
        }

        .member input[type=button],
        .member input[type=submit]{
            background-color: #2db400;
            color:#fff
        }

        .member input:focus, .member select:focus{
            border: 1px solid #2db400;
        }

        .field.birth div{ /*field 이면서 birth*/
            display: flex;
            gap:10px; /*간격 벌려줄때 공식처럼 사용핟나 */
        }

        .field.tel-number div {
            display: flex;
        }

        .field.tel-number div input:nth-child(1){
            flex:2;
        }

        .field.tel-number div input:nth-child(2){
            flex:1;
        }

        .field.gender div{
            border: 1px solid #dadada;
            padding: 15px 5px;
            background-color: #fff;
        }

        .member-footer div a:hover{
            text-decoration: underline;
            color:#2db400
        }

        .member-footer div a:after{
            content:'|';
            font-size: 10px;
            color:#bbb;
            margin-right: 5px;
            margin-left: 7px;
            /*살짝 내려가 있기 때문에 위로 올려주기 위해 transform 사용하기*/
            display: inline-block;
            transform: translateY(-1px);

        }

        .member-footer div a:last-child:after{
            display: none;
        }

        @media (max-width:768px) {
            .member{
                width: 100%;
            }
        }
        hr {
            background-color: #3a3a3a;
            border: none;
            display: block;
            height: 2px;
            margin: 1.5rem 0;
        }
    </style>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<div class="container is-fullhd">
    <!-- 헤더 부분 인클루드 -->
    <jsp:include page="../include/hd.jsp"></jsp:include>
    <div class="content" id="contents">
        <div class="row column text-center">
            <h2 class="h1">회원가입</h2>
            <hr>
            <div class="container">
                <form name="frm1" id="frm1" action="${path1 }/member/insert.do" method="post" onsubmit="return joinCheck(this)">

                    <div class="member">
                        <div class="field">
                            <b>아이디</b>
                            <input type="text" name="id" id="id" placeholder="아이디 입력" pattern="^[a-z0-9]{5,12}" maxlength="12">
                            <input type="button" id="idCkBtn" class="button" value="아이디 중복 체크" onclick="idCheck()">
                            <input type="hidden" name="idck" id="idck" value="no"/>
                            <c:if test="${empty qid }">
                                <p id="msg" style="padding-left:0.5rem">아직 아이디 중복 체크를 하지 않으셨습니다.</p>
                            </c:if>
                            <c:if test="${not empty qid }">
                                <p id="msg" style="padding-left:0.5rem">아이디 중복 체크후 수정하였습니다.</p>
                            </c:if>
                        </div>

                        <div class="field">
                            <b>비밀번호</b>
                            <input type="password" name="pw" id="pw" placeholder="비밀번호 입력" maxlength="12" required>
                            <!-- pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,12}$"  -->
                        </div>
                        <div class="field">
                            <b>비밀번호 확인</b>
                            <input type="password" name="pw2" id="pw2" placeholder="비밀번호 확인 입력" maxlength="12" required>
                            <!-- pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,12}$"  -->
                        </div>

                        <div class="field">
                            <b>이름</b>
                            <input type="text" name="name" id="name" placeholder="이름 입력" maxlength="40" required>
                        </div>

                        <!-- 3. 필드(생년월일) -->
                        <div class="field birth">
                            <b>생년월일</b>
                            <div>
                                <input type="date" name="birth" id="birth" placeholder="생년월일 입력" required>
                            </div>
                        </div>

                        <div class="field">
                            <b>주소</b>
                            <input type="text" name="addr1" id="addr1" placeholder="기본주소 입력" maxlength="150" required><br><br>
                            <input type="text" name="addr2" id="addr2" placeholder="상세주소 입력" maxlength="90" required><br><br>
                            <input type="text" name="postcode" id="postcode" placeholder="우편번호 입력" maxlength="9" required>
                            <input type="button" id="isAddrBtn" class="button" value="주소 입력" onclick="findAddr()">
                            <input type="hidden" name="addrck" id="addrck" value="no"/>
                        </div>

                        <!-- 5. 이메일_전화번호 -->
                        <div class="field">
                            <b>본인 확인 이메일<small>(선택)</small></b>
                            <input type="email" name="email" id="email" placeholder="이메일 입력" pattern="^\w+((\.\w+)?)+@\w+.?\w+\.\w+$" maxlength="80" required>
                        </div>


                        <div class="field tel-number">
                            <b>휴대전화</b>
                            <div>
                                <input type="tel" name="tel" id="tel" placeholder="전화번호 입력" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="19" required>
                            </div>
                            <div/>

                            <!-- 6. 가입하기 버튼 -->
                            <td colspan="2">
                                <input type="submit" class="submit success button" value="회원 가입" >
                                <input type="reset" class="reset button" value="취소" >
                            </td>
                        </div>
                </form>
                <script>
                    $(document).ready(function(){
                        $("#id").keyup(function(){
                            $("#idck").val("no");
                            if($(this).val()!=""){
                                $("#msg").html("<strong>아이디 입력중입니다.</strong>");
                            } else {
                                $("#msg").html("아직 아이디 중복 체크를 하지 않으셨습니다.");
                            }
                        });
                    });
                </script>
                <script>
                    function idCheck() {
                        var id = $("#id").val();
                        if (id === "") {
                            alert("아이디를 입력하세요.");
                            $("#id").focus();
                            return;
                        }

                        // 아이디 중복 확인을 위해 서버에 AJAX 요청 보내기
                        $.ajax({
                            url: "${path1}/member/idCheck.do",
                            type: "post",
                            dataType: "json",
                            data: { id: id },
                            success: function (result) {
                                console.log(result.result);
                                var idChk = result.result;

                                if (idChk === false) {
                                    $("#idck").val("no");
                                    $("#msg").html("<strong style='color:red'>기존에 사용되고 있는 아이디입니다. 다시 입력하세요.</strong>");
                                    $("#id").focus();
                                } else if (idChk === true) {
                                    $("#idck").val("yes");
                                    $("#msg").html("<strong style='color:blue'>사용 가능한 아이디입니다.</strong>");
                                } else {
                                    $("#msg").html("<strong>아이디 확인 중 오류가 발생했습니다. 다시 시도하세요.</strong>");
                                }
                            },
                            error: function () {
                                $("#msg").html("<strong>서버 오류가 발생했습니다. 다시 시도하세요.</strong>");
                            }
                        });
                    }
                </script>
                <script>
                    function findAddr() {
                        new daum.Postcode({
                            oncomplete: function(data) {
                                console.log(data);
                                var roadAddr = data.roadAddress;
                                var jibunAddr = data.jibunAddress;
                                document.getElementById("postcode").value = data.zonecode;
                                if(roadAddr !== '') {
                                    document.getElementById("addr1").value = roadAddr;
                                } else if(jibunAddr !== ''){
                                    document.getElementById("addr1").value = jibunAddr;
                                }
                                document.getElementById("addr2").focus();
                            }
                        }).open();
                    }
                </script>
                <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../include/ft.jsp"></jsp:include>
</body>
</html>