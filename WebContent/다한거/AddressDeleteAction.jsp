<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.bunge.dao.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>주소삭제</title>
</head>
<body>
	<%
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));

		int productnumber_pk = 0;
		try {
			productnumber_pk = Integer.parseInt(request.getParameter("productnumber_pk"));
		} catch(NumberFormatException e) { }
	
		AccountPlaceDao apDao = new AccountPlaceDao();
		request.setCharacterEncoding("utf-8");
		String addressName = request.getParameter("address_name");
		String phoneNumber = request.getParameter("phone_number");
		String address = request.getParameter("address");
		String detailedAddress = request.getParameter("detailed_address");
		String nicknamePk = request.getParameter("nickname_pk");
		apDao.updateAddressToDelete(addressName, phoneNumber, address, detailedAddress, NICKNAME_PK);
	%>
	<script>
		alert("등록된 주소정보가 삭제되었습니다");
		opener.location.reload();
		location.href="AddressManagement.jsp?productnumber_pk=<%=productnumber_pk%>";
	</script>
</body>
</html>