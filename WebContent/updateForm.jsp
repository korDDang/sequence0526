<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function check() {
	var doc=document.form;
	if(doc.id.value==""){
		alert("사번이 입력되지 않았습니다.");
		doc.id.focus();
	}else if(doc.name.value==""){
		alert("성명이 입력되지 않았습니다.");
		doc.name.focus();
	}else if(doc.dept.value==""){
		alert("소속부서가 입력되지 않았습니다.");
		doc.dept.focus();
	}else{
		doc.submit();
	}
	
}

</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp"%>
<section>
<% 
ResultSet rs=null;
PreparedStatement pstmt=null;
String id=request.getParameter("id");
try{
	String sql="select * from person0526 where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs=pstmt.executeQuery();
	if(rs.next()){
		String name=rs.getString("name");
		String dept=rs.getString("dept");
		String position=rs.getString("position");
		String duty=rs.getString("duty");
		String phone=rs.getString("phone");
	

%>
<h2>인사관리 사원등록 화면</h2>
<br>
<form name="form" method="post" action="updateFormProcess.jsp">
<table border="1" id="tab1">
<tr>
<th>사원번호</th>
<td><input type="text" name="id" value="<%=id%>"></td>
</tr>
<tr>
<th>성명</th>
<td><input type="text" name="name" value="<%=name %>"></td>
</tr>
<tr>
<th>소속부서</th>
<td><select name="dept" >
<option value="인사부" <%if(dept.equals("인사부")){%>selected<%} %>>인사부</option>
<option value="기획부" <%if(dept.equals("기획부")){%>selected<%} %>>기획부</option>
<option value="홍보부" <%if(dept.equals("홍보부")){%>selected<%} %>>홍보부</option>
<option value="영업부" <%if(dept.equals("영업부")){%>selected<%} %>>영업부</option>
<option value="경리부" <%if(dept.equals("경리부")){%>selected<%} %>>경리부</option>
</select>
</td>
</tr>
<tr>
<th>직급</th>
<td><select name="position">
<option value="1" <%if(position.equals("1")){%>selected<%} %>>1급</option>
<option value="2" <%if(position.equals("2")){%>selected<%} %>>2급</option>
<option value="3" <%if(position.equals("3")){%>selected<%} %>>3급</option>
<option value="4" <%if(position.equals("4")){%>selected<%} %>>4급</option>
</select>
</td>
</tr>
<tr>
<th>직책</th>
<td><input type="text" name="duty" value="<%=duty %>"></td>
</tr>
<tr>
<th>연락처</th>
<td><input type="text" name="phone" value="<%=phone %>"></td>
</tr>
<tr>
<td>
<td>
<input type="button" value="등록" onclick="check()">
<input type="reset" value="취소">
</td>
</tr>
	<% 
}
}catch(Exception e){
	e.printStackTrace();
}
	%>
</table>
</form>
</section>

<%@ include file="footer.jsp" %>
</body>
</html>