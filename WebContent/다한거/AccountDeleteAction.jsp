<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.bunge.dao.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>계좌삭제</title>
</head>
<body>
	<%
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
			
		int rno = Integer.parseInt(request.getParameter("rno"));
		System.out.println("rno 들어옴 : " + rno);
		int dno = Integer.parseInt(request.getParameter("dno"));
		
		AccountPlaceDao apDao = new AccountPlaceDao();
		request.setCharacterEncoding("utf-8");
		String bankName = request.getParameter("bankName");
		String accountHolder = request.getParameter("accountHolder");
		String accountNumber = request.getParameter("accountNumber");
		apDao.updateAccountToDelete(bankName, accountHolder, accountNumber, NICKNAME_PK);
	%>
	<script>
		var rno = <%=rno%>;
		var dno = <%=dno%>;
		alert("등록된 계좌정보가 삭제되었습니다");
		location.href="AccountManagement.jsp?rno="+rno+'&dno='+dno;
	</script>
</body>
</html>