<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
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
Connection con;
Class.forName("com.mysql.cj.jdbc.Driver");

String url = "jdbc:mysql://localhost:3305/nothing";
String id = "root";
String pwd = "1234";

con = DriverManager.getConnection(url,id,pwd);
Statement stmt = con.createStatement();

ResultSet rs = stmt.executeQuery("SELECT WT_NUM,WT_NAME,WT_NAME2,WT_CONTENT,WT_TITLE,WT_SUBTITLE,WT_INDEXNUM,WT_ID,WT_PWD,WT_DK FROM WORK_TABLE");
%>

<table border = "1">
<tr>
<th>번호</th>
<th>이름</th>
<th>이름1</th>
<th>내용</th>
<th>제목</th>
<th>부제</th>
<th>숫자</th>
<th>아이디</th>
<th>비번</th>
<th>몰라</th>
</tr>


<%
while(rs.next()){
	int wtNum = rs.getInt("WT_NUM");
	String wtName = rs.getString("WT_NAME");
	String wtName2 = rs.getString("WT_NAME2");
	String wtContent = rs.getString("WT_CONTENT");
	String wtTitle = rs.getString("WT_TITLE");
	String wtSubtitle = rs.getString("WT_SUBTITLE");
	int wtIndexnum = rs.getInt("WT_INDEXNUM");
	String wtId = rs.getString("WT_ID");
	String wtPwd = rs.getString("WT_PWD");
	String wtDk = rs.getString("WT_DK");
	
	out.println("<td>"+wtNum+"</td>");
	out.println("<td>"+wtName+"</td>");
	out.println("<td>"+wtName2+"</td>");
	out.println("<td>"+wtContent+"</td>");
	out.println("<td>"+wtTitle+"</td>");
	out.println("<td>"+wtSubtitle+"</td>");
	out.println("<td>"+wtIndexnum+"</td>");
	out.println("<td>"+wtId+"</td>");
	out.println("<td>"+wtPwd+"</td>");
	out.println("<td>"+wtDk+"</td>");
	out.println("</tr>");
}
%>

</table>
</body>
</html>