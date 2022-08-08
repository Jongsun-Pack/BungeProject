<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bunge.dao.*" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>거래내역에 계좌번호 추가</title>
	<%
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
		DealingDao dlDao = new DealingDao();
		ChatDao cDao = new ChatDao();
		int rno = Integer.parseInt(request.getParameter("rno"));
		//System.out.println("rno 들어옴 : " + rno);
		int dno = Integer.parseInt(request.getParameter("dno"));
		
		// ConsumerGetRealRequest2에서 계좌번호, 예금주, 은행명 받아오기
		String accountNumber = request.getParameter("accountNumber");
		String bankName = request.getParameter("bankName");
		String accountHolder = request.getParameter("accountHolder");
		
		
		dlDao.updateSellerToConsumerDealDone(bankName, accountHolder, accountNumber, dno);
		cDao.insertChat(rno, NICKNAME_PK, "/;/판매자의_거래요청/;/");
	%>
	<script>
		var rno = <%=rno%>;
		var dno = <%=dno%>;
		location.href="ConsumerToDealRequest.jsp?rno="+rno+'&dno='+dno;
	</script>
</head>
<body>
</body>
</html>