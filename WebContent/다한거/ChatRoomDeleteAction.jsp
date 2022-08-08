<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bunge.dao.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>채팅방나가기</title>
	<%
		ChatDao cDao = new ChatDao();
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
		int rno = Integer.parseInt(request.getParameter("rno"));
		int dno = Integer.parseInt(request.getParameter("dno"));
		
		// 채팅방 나가기
		cDao.updateChatGetOut("y", rno, dno);
	%>
</head>
<body>
	<script>
		alert("채팅방을 나갔습니다");
		var rno = <%=rno%>;
		var dno = <%=dno%>;
		location.href="TalkMainScreen3.jsp?rno=" + rno + '&dno=' + dno;
	</script>
</body>
</html>