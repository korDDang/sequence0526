<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
		request.setCharacterEncoding("utf-8");
        PreparedStatement pstmt=null;
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		
		try{
			String sql="delete from person0526 where id=? and name=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
		    pstmt.executeUpdate();
		    System.out.println(id);
		%>
		<script>
		alert("삭제 완료");
		history.back(-1);
		</script>
		<% 
	
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("데이터베이스 에러");
}
 
%>
</body>
</html>