<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/home-insert-ok.jsp" method="POST">
<input type="text" name="uiId" placeholder="아이디 입력"><br>
<input type="password" name="uiPwd" placeholder="비번 입력"><br>
<input type="text" name="uiName" placeholder="이름 입력"><br>
<input type="text" name="uiEmail" placeholder="이메일 입력"><br>
<input type="text" name="uiAddress" placeholder="주소 입력"><br>
<input type="text" name="uiBirth" placeholder="생년월일 입력"><br>
<input type="text" name="uiTrans" placeholder="성별 입력"><br>
<button>유저등록</button>
</form>
</body>
</html>