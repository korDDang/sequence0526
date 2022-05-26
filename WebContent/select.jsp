<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<%@include file="DBConn.jsp" %>
<section id="sec1">
<h2>직원 정보 조회</h2>
<br>
<%
request.setCharacterEncoding("utf-8");
ResultSet rs=null;
PreparedStatement pstmt=null;
int no=0;
try{
	String sql="select * from person0526";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String id=rs.getString("id");
		String name=rs.getString("name");
		String dept=rs.getString("dept");
		String position=rs.getString("position");
		String duty=rs.getString("duty");
		String phone=rs.getString("phone");
		no++;
	

%>



<table border="1" id="tab1">
<tr>
<th>no</th>
<th>성명</th>
<th>사번</th>
<th>직급</th>
<th>직책</th>
<th>연락처</th>
<th>소속부서</th>
</tr>
<tr>
<td><%=no %></td>
<td><%=name %></td>
<td><a href="updateForm.jsp?id=<%=id %>"><%=id %></a></td>
<td><%=position %></td>
<td><%=duty%></td>
<td><%=phone %></td>
<td><%=dept %></td>
</tr>
<% 
}
	
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("조회실패");
}
%>
</table>
</section>
<%@include file="footer.jsp" %>
</body>
</html>