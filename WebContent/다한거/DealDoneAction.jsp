<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bunge.dao.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>거래완료DB추가</title>
	<%
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
		DealingDao dlDao = new DealingDao();
		ChatDao cDao = new ChatDao();
		int rno = Integer.parseInt(request.getParameter("rno"));
		int dno = Integer.parseInt(request.getParameter("dno"));
		
		String dealDate = request.getParameter("dealDate");
		dlDao.updateDealDone(dno);
		
		int productnumber = cDao.getProductnumberFromDno(dno);
		
		dlDao.updateDealCheck(productnumber);
		cDao.insertChat(rno, NICKNAME_PK, "/;/택배거래완료/;/");
		cDao.updateChatDeliveryDone(rno);
		
	%>
	<script>
		opener.location.reload();
		location.href="DealDone.jsp?rno="+<%=rno%>+'&dno='+<%=dno%>;
	</script>
</head>
<body>
	
</body>
</html>