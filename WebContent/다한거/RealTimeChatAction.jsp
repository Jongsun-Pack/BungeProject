<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bunge.dao.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>채팅보내기</title>
	<%
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
		request.setCharacterEncoding("utf-8");
		ChatDao cDao = new ChatDao(); 
		int rno = Integer.parseInt(request.getParameter("rno"));
		int dno = Integer.parseInt(request.getParameter("dno"));
		String chatInput = request.getParameter("chatInput");
		
		cDao.insertChat(rno, NICKNAME_PK, chatInput);
	%>
</head>
<body>
	<script>
		var rno = <%=rno%>;
		var dno = <%=dno%>;
		location.href="TalkMainScreen3.jsp?rno="+rno+'&dno='+dno;
	</script>
</body>
</html>