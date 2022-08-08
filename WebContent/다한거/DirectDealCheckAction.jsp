<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bunge.dao.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<%
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
		DealingDao dlDao = new DealingDao();
		ChatDao cDao = new ChatDao();
		int rno = Integer.parseInt(request.getParameter("rno"));
		int dno = Integer.parseInt(request.getParameter("dno"));
		DealingDao dDao = new DealingDao();
		dDao.updateDealDone(dno);
		
		int productnumber = cDao.getProductnumberFromDno(dno);
		
		dlDao.updateDealCheck(productnumber);
		
		cDao.insertChat(rno, NICKNAME_PK, "/;/직거래완료/;/");
		cDao.updateChatDirectDone(rno);
	%>
</head>
<body>
	<script>
		opener.location.reload();
		location.href="DirectDealDone.jsp?rno=<%=rno%>&dno=<%=dno%>";
	</script>
</body>
</html>