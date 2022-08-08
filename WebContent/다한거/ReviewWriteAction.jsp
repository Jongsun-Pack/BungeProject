<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bunge.dao.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>후기작성DB에 넣기</title>
	<%
		ReviewDao rDao = new ReviewDao();
		request.setCharacterEncoding("utf-8");
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
		int rno = Integer.parseInt(request.getParameter("rno")); // 채팅방번호
//System.out.println("ReviewWrite rno = " + rno);
		int dno = Integer.parseInt(request.getParameter("dno"));
//System.out.println("ReviewWrite dno = " + dno);
		String purchaseFk = request.getParameter("purchaseFk"); // 구매자닉네임
//System.out.println("ReviewWrite purchaseFk = " + purchaseFk);
		String sellerFk = request.getParameter("sellerFk"); // 판매자닉네임
//System.out.println("ReviewWrite sellerFk = " + sellerFk);
		String reviewWrite = request.getParameter("reviewWrite"); // 후기작성내용
//System.out.println("ReviewWrite reviewWrite = " + reviewWrite);
		
		if(purchaseFk.equals(NICKNAME_PK)) { // 로그인아이디가 구매자일경우
System.out.println("ReviewWrite 구매자와 로그인아이디가 같을경우 = " + purchaseFk + "/" + NICKNAME_PK);
			rDao.insertReview(sellerFk, reviewWrite, NICKNAME_PK); 
		} else if(sellerFk.equals(NICKNAME_PK)) { // 로그인아이디가 판매자일경우
System.out.println("ReviewWrite 판매자와 로그인아이디가 같을경우 = " + sellerFk + "/" + NICKNAME_PK);
			rDao.insertReview(purchaseFk, reviewWrite, NICKNAME_PK);
		}
	%>
</head>
<body>
	<script>
		<%-- var rno = <%=rno%>; --%>
		<%-- var dno = <%=dno%>; --%>
		//location.href="TalkMainScreen3.jsp?rno=" + rno + '&dno=' + dno + '&sellerFk=' + sellerFk;
		alert("후기작성이 완료되었습니다");
		location.href="TalkMainScreen3.jsp";
	</script>
</body>
</html>