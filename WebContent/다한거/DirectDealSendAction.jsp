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
		request.setCharacterEncoding("utf-8");
		DealingDao dDao = new DealingDao();
		ChatDao cDao = new ChatDao();
		int productnumber_pk = 0;
		try {
			productnumber_pk = Integer.parseInt(request.getParameter("productnumber_pk"));
		} catch(NumberFormatException e) { }
		
		String sellerFk = request.getParameter("sellerFk");
//System.out.println("nicknameFk가져옴 : " + sellerFk);
		String imagename = request.getParameter("imagename");
		//System.out.println("imagename가져옴 : " + imagename);
		String productname = request.getParameter("productname");
		//System.out.println("productname가져옴 : " + productname);
		int price = Integer.parseInt(request.getParameter("price"));
		
		String dealingDate = request.getParameter("dealingDate");
//System.out.println("거래일 : " + dealingDate);
		String directPlace = request.getParameter("directPlace");
//System.out.println("장소 : " + directPlace);
		// 거래내역에 직거래정보 추가
		dDao.insertDirectToDeal(sellerFk, NICKNAME_PK, productname, price, directPlace, imagename, productnumber_pk, dealingDate);
		
		// dno값 가져오기
		int dno = cDao.getDnoFromConsumerFkProductNumber(NICKNAME_PK, productnumber_pk);
		System.out.println("dno값은 ???? : " + dno);
		
		// 채팅방 열기
		cDao.insertRnoPurchaseFkSellerFkDno(NICKNAME_PK, sellerFk, dno);

		// 방번호 가져오기
		int rno = cDao.getDnoFromConsumerFkProductNumber(dno);
		
		System.out.println("rno값은?????? : " + rno);

		// 상품상세보기
		cDao.insertChat(rno, NICKNAME_PK, "/;/상품상세보기/;/");
		
		// 구매자가 판매자에게 직거래요청
		cDao.insertChat(rno, NICKNAME_PK, "/;/직거래요청/;/");
	%>
</head>
<body>
	<script>
		opener.location.reload();
		location.href="DirectDealCheck.jsp?rno=<%=rno%>&dno=<%=dno%>";
 	</script>
</body>
</html>