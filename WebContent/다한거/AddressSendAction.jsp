<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.bunge.dao.*"%>
<%
	String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
	DealingDao dlDao = new DealingDao();
	ChatDao cDao = new ChatDao();
	int productnumber_pk = 0;
	try {
		productnumber_pk = Integer.parseInt(request.getParameter("productnumber_pk"));
	} catch(NumberFormatException e) { }
	System.out.println("productnumber_pkSendAction="+productnumber_pk);
	
	String sellerFk = request.getParameter("sellerFk");
	String productName = request.getParameter("productName");
	int price = Integer.parseInt(request.getParameter("price"));
	String address = request.getParameter("address");
	String detailedAddress = request.getParameter("detailedAddress");
	String addressName = request.getParameter("addressName");
	//String phoneNumber = request.getParameter("phoneNumbe r");
	String imagename = request.getParameter("imagename"); 
	String deliveryCharge = request.getParameter("deliveryCharge");
	
	// insert: 상품상세보기메시지 = 채팅방 열면서 자동으로 넣어주는 문장#1. 
	//int rno = cDao.getRnoOrCreateRnoFromProductNumber(productnumber_pk, NICKNAME_PK);
	
	// 거래내역에 택배거래정보 추가
	dlDao.insertConsumerToSellerDeal(sellerFk, NICKNAME_PK, productName, price, address, detailedAddress, addressName, imagename, deliveryCharge, productnumber_pk);
	
	// dno값 가져오기
	int dno = cDao.getDnoFromConsumerFkProductNumber(NICKNAME_PK, productnumber_pk);
	
	// 채팅방 열기
	cDao.insertRnoPurchaseFkSellerFkDno(NICKNAME_PK, sellerFk, dno);
	
	// 방번호 가져오기
	int rno = cDao.getDnoFromConsumerFkProductNumber(dno);
//System.out.println("rnooo : " + rno);
	cDao.insertChat(rno, NICKNAME_PK, "/;/상품상세보기/;/");
//System.out.println("상품상세보기 productNumber = " + productnumber_pk); 
	
	// insert: 택배거래요청메시지 = 채팅방 열면서 자동으로 넣어주는 문장#2.
	cDao.insertChat(rno, NICKNAME_PK, "/;/구매자의_거래요청/;/");

	// 구매자가 판매자에게 주소보내기
	//dlDao.insertConsumerToSellerDeal(sellerFk, NICKNAME_PK, productName, price, address, detailedAddress, addressName, imagename, deliveryCharge, productnumber_pk);
//System.out.println("딜링  productNumber = " + productnumber_pk);
	// 구매요청
	//dlDao.insertPurchaseRequest(sellerFk, NICKNAME_PK, productnumber_pk, address, detailedAddress, addressName, price);
%>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
	 opener.location.reload();
	 location.href="SellerToDealRequest.jsp?productnumber_pk=<%=productnumber_pk%>";
</script>