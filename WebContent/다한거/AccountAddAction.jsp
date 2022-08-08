<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.bunge.dto.*" %>
<%@ page import="com.bunge.dao.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보에 계좌추가</title>
	<%
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
		request.setCharacterEncoding("utf-8");
		AccountPlaceDao apDao = new AccountPlaceDao();
	
		int rno = Integer.parseInt(request.getParameter("rno"));
		//System.out.println("rno 들어옴 : " + rno);
		int dno = Integer.parseInt(request.getParameter("dno"));
		
		// AccountAdd에서 예금주, 계좌번호, 은행명 받아오기
		String bankName = request.getParameter("bankName");
		String accountHolder = request.getParameter("accountHolder");
		String accountNumber = request.getParameter("accountNumber");
		
 		if(bankName!=null && accountHolder!=null && accountNumber!=null) {
			apDao.updateAccountSend(bankName, accountHolder, accountNumber, NICKNAME_PK); 
		} else {
			String strAccountSelect = apDao.getAccountSelect(NICKNAME_PK);
			String[] arrStrAccountSelect = strAccountSelect.split("/");
			bankName = arrStrAccountSelect[0]; // 은행이름
			accountHolder = arrStrAccountSelect[1];  // 예금주
			accountNumber = arrStrAccountSelect[2];  // 계좌번호
		} 
	%>
	<script>
		var rno = <%=rno%>;
		var dno = <%=dno%>;
		location.href="AccountManagement.jsp?rno="+rno+'&dno='+dno;
	</script>
</head>
<body>

</body>
</html>