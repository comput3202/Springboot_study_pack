<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Date"%>
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
String searchUiName = request.getParameter("uiName");
String searchUiId = request.getParameter("uiId");

out.println("검색한 이름 : " + searchUiName);
Class.forName("com.mysql.cj.jdbc.Driver");

String url = "jdbc:mysql://localhost:3305/nothing";
String id = "root";
String pwd = "1234";

Connection con = DriverManager.getConnection(url,id,pwd);
String sql = "SELECT UI_NUM, UI_NAME, UI_ID, UI_PWD, UI_DATE FROM USER_INFO";
if(searchUiName !=null ){
	sql += " WHERE UI_NAME LIKE CONCAT('%',?,'%')";
	if(searchUiId !=null){
		sql += " AND UI_ID LIKE CONCAT('%',?,'%')";
	}
}else if(searchUiId != null){
	sql += " WHERE UI_ID LIKE CONCAT('%',?,'%')";
}



PreparedStatement stmt = con.prepareStatement(sql);


if(searchUiName !=null ){
	stmt.setString(1,searchUiName);
	if(searchUiName !=null){
		stmt.setString(2,searchUiName);
	}
}else if(searchUiId != null){
	stmt.setString(1,searchUiId);
}


ResultSet rs = stmt.executeQuery();
%>

<form>
<input type="text" name ="uiName" placeholder="검색할 이름">
<input type="text" name ="uiId" placeholder="검색할 아이디">
<button>검색</button>
</form>

<table border = "1">

<tr>
<th>번호</th>
<th>이름</th>
<th>아이디</th>
<th>비밀번호</th>
<th>날짜</th>
</tr>


<%
while(rs.next()){
	int uiNum = rs.getInt("UI_NUM");
	out.println("<tr onclick=\"location.href='/user-view.jsp?uiNum=" + uiNum + "'\">");
	out.println("<td>"+rs.getInt("UI_NUM")+"</td>");
	String uiName = rs.getString("UI_NAME");
	
	String uiId = rs.getString("UI_ID");
	String uiPwd = rs.getString("UI_PWD");
	Date uiDate = rs.getDate("UI_DATE"); //데이터타입 Date로 가져오기
	
	out.println("<td>"+uiNum+"</td>");
	
	out.println("<td>"+uiName+"</td>");
	out.println("<td>"+uiPwd+"</td>");
	out.println("<td>"+uiDate+"</td>");
	out.println("</tr>");
}
%>

<tr>
<th colspan="4"> <button type="button" onclick="location.href='/user-insert.jsp'">버튼</button></th>
</tr>
</table>

</body>
</html>