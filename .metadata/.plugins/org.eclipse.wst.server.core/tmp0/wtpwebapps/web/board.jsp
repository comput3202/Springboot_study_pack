<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Connection con; //커넥션 준비
	Class.forName("com.mysql.cj.jdbc.Driver"); //유심장착

	String url = "jdbc:mysql://localhost:3305/nothing"; //전화번호
	String id = "root"; //아이디
	String pwd = "1234"; //비밀번호

	con = DriverManager.getConnection(url, id, pwd);
	Statement stmt = con.createStatement(); //sql 입력창 만든 것

	ResultSet rs = stmt.executeQuery("SELECT BI_NUM,BI_TITLE,BI_WRITER,BI_CNT FROM BOARD_INFO");
	//ResultSet은 SELECT문의 결과를 저장하는 객체
	//executeQuery 1. 수행결과로 ResultSet 객체의 값을 반환합니다. 2. SELECT 구문을 수행할 때 사용되는 함수입니다.
	%>

	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
		</tr>

		<%
		while (rs.next()) {
			int biNum = rs.getInt("BI_NUM");
			String biTitle = rs.getString("BI_TITLE");
			String biWriter = rs.getString("BI_WRITER");
			int biCnt = rs.getInt("BI_CNT");
			out.println("<td>" + biNum + "</td>");
			out.println("<td>" + biTitle + "</td>");
			out.println("<td>" + biWriter + "</td>");
			out.println("<td>" + biCnt + "</td>");
			out.println("</tr>");
		}
		%>
	</table>
</body>
</html>