<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.bunge.dto.*" %>
<%@ page import="com.bunge.dao.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>주소추가하기</title>
	<%
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
		AccountPlaceDao apDao = new AccountPlaceDao();
		ProductDao pdDao = new ProductDao();
		request.setCharacterEncoding("utf-8");
	
		int productnumber_pk = 0;
		try {
			productnumber_pk = Integer.parseInt(request.getParameter("productnumber_pk"));
		} catch(NumberFormatException e) { }
		System.out.println("이것은 AddressAddAction상품번호다=" + productnumber_pk); 
		String addressName = request.getParameter("addressName");
		String phoneNumber = request.getParameter("phoneNumber");
		String address = request.getParameter("address");
		String detailedAddress = request.getParameter("detailedAddress");
		
		apDao.updateAddressSend(addressName, phoneNumber, address, detailedAddress, NICKNAME_PK);
		if(addressName!=null && phoneNumber!=null && address!=null && detailedAddress!=null) {
			apDao.updateAddressSend(addressName, phoneNumber, address, detailedAddress, NICKNAME_PK); 
		} else {
			String strAddressSelect = apDao.getAddressSelect(NICKNAME_PK);
			String[] arrStrAddressSelect = strAddressSelect.split("/");
			addressName = arrStrAddressSelect[0]; // 이름
			phoneNumber = arrStrAddressSelect[1];  // 핸드폰번호
			address = arrStrAddressSelect[2];  // 주소
			detailedAddress = arrStrAddressSelect[3]; // 상세주소
		} 
	%>
	<script>
		location.href="AddressManagement.jsp?productnumber_pk=<%=productnumber_pk%>";
	</script>
</head>
<body>

</body>
</html>