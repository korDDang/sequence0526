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
<section id="sec1">
<% 
ResultSet rs=null;
PreparedStatement pstmt=null;
int a=0;
try{
	String sql="select sq1.nextval from dual";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	 if(rs.next()){
		a=rs.getInt(1);
	 }
}catch(SQLException e){
	e.printStackTrace();
}
%>
<h2>인사관리 사원등록 화면</h2>
<br>
<form name="form" method="post" action="insertFormProcess.jsp">
<table border="1" id="tab1">
<tr>
<th>사원번호</th>
<td><input type="text" name="id" value="<%=a%>"></td>
</tr>
<tr>
<th>성명</th>
<td><input type="text" name="name"></td>
</tr>
<tr>
<th>소속부서</th>
<td><select name="dept">
<option value="인사부" >인사부</option>
<option value="기획부" >기획부</option>
<option value="홍보부">홍보부</option>
<option value="영업부">영업부</option>
<option value="경리부">경리부</option>
</select>
</td>
</tr>
<tr>
<th>직급</th>
<td><select name="position">
<option value="1">1급</option>
<option value="2">2급</option>
<option value="3">3급</option>
<option value="4">4급</option>
</select>
</td>
</tr>
<tr>
<th>직책</th>
<td><input type="text" name="duty"></td>
</tr>
<tr>
<th>연락처</th>
<td><input type="text" name="phone"></td>
</tr>
<tr>
<td>
<td colspan="2" id="tdbt1">
<input type="button" value="등록" onclick="check()">
<input type="reset" value="취소">
</td>
</tr>
</table>
</form>
</section>

<%@ include file="footer.jsp" %>
</body>
</html>