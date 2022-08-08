<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bunge.dao.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>거래취소 거래내역에 업데이트</title>
	<%
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
		request.setCharacterEncoding("utf-8");
		DealingDao dlDao = new DealingDao();
		ChatDao cDao = new ChatDao();
		
		int rno = Integer.parseInt(request.getParameter("rno"));
System.out.println("rno값 들어옴!" + rno);
		int dno = Integer.parseInt(request.getParameter("dno"));
System.out.println("dno값 들어옴?!" + dno);
		String cancelReason = request.getParameter("cancelReason");
		String cancelReasonDetail = request.getParameter("cancelReasonDetail");
		
		dlDao.updateDealCancel(cancelReason, cancelReasonDetail, dno);
		cDao.updateChatCancel(rno);
		
		// 거래취소 메시지보내기
		cDao.insertChat(rno, NICKNAME_PK, "/;/거래취소/;/");
	%>
</head>
<body>
	<script>
		var rno = <%=rno%>;
		var dno = <%=dno%>;
		opener.location.reload();
		location.href="DealCancel.jsp?rno="+rno+'&dno='+dno;
	</script>
</body>
</html>