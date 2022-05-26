<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<section id="sec1">
<h2>인사관리 사원정보삭제 화면</h2>
<%@include file="DBConn.jsp" %>
<form name="form" method="post" action="deleteprocess.jsp">
<table border="1" id="tab1">
<tr>
<th>성명</th>
<td><input type="text" name="name"></td>
</tr>
<tr>
<th>사원번호</th>
<td><input type="text" name="id"></td>
</tr>
<tr>
<td colspan="2" id="tdbt">
<input type="submit" value="삭제" >
<input type="button" value="취소" onclick="location.href='index.jsp'">

</table>
</form>
</section>
<%@include file="footer.jsp" %>
</body>
</html>