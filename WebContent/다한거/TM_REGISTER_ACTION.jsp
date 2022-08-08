<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%
    String driver = "oracle.jdbc.driver.OracleDriver";
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String dbID = "bg";
	String dbPW = "1234";
	
	Connection conn = null;
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url,dbID,dbPW);
	} catch (Exception e){
		e.printStackTrace();
	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String NICKNAME_PK = request.getParameter("NICKNAME_PK");
	String NAME = request.getParameter("NAME");
	int BIRTH_DATE1 = Integer.parseInt(request.getParameter("BIRTH_DATE1"));
	int BIRTH_DATE2 = Integer.parseInt(request.getParameter("BIRTH_DATE2"));
	String PHONE_NUMBER = request.getParameter("PHONE_NUMBER");
	String EMAIL = request.getParameter("EMAIL");
	int AGREE1 = Integer.parseInt(request.getParameter("AGREE1"));
	int AGREE2 = Integer.parseInt(request.getParameter("AGREE2"));
	int AGREE3 = Integer.parseInt(request.getParameter("AGREE3"));
	int AGREE4 = Integer.parseInt(request.getParameter("AGREE4"));
	int AGREE5 = Integer.parseInt(request.getParameter("AGREE5"));
	int AGREE6 = Integer.parseInt(request.getParameter("AGREE6"));
	int AGREE7 = Integer.parseInt(request.getParameter("AGREE7"));
	int AGREE8 = Integer.parseInt(request.getParameter("AGREE8"));
	int visits = 0;
	int sell = 0;
	int delivery = 0;
	int following = 0;
	int follower = 0;

	String sql = "insert into PROFILE(NICKNAME_PK, NAME,BIRTH_DATE1,BIRTH_DATE2,PHONE_NUMBER,EMAIL,AGREE1,AGREE2,AGREE3,AGREE4,AGREE5,AGREE6,AGREE7,AGREE8,visits,SELL,DELIVERY,FOLLOWING,FOLLOWER,OPENING_DAY) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, NICKNAME_PK);
	pstmt.setString(2, NAME);
	pstmt.setInt(3, BIRTH_DATE1);
	pstmt.setInt(4, BIRTH_DATE2);
	pstmt.setString(5, PHONE_NUMBER);
	pstmt.setString(6, EMAIL);
	pstmt.setInt(7, AGREE1);
	pstmt.setInt(8, AGREE2);
	pstmt.setInt(9, AGREE3);
	pstmt.setInt(10, AGREE4);
	pstmt.setInt(11, AGREE5);
	pstmt.setInt(12, AGREE6);
	pstmt.setInt(13, AGREE7);
	pstmt.setInt(14, AGREE8);
	pstmt.setInt(15, visits);
	pstmt.setInt(16, sell);
	pstmt.setInt(17, delivery);
	pstmt.setInt(18, following);
	pstmt.setInt(19, follower);
%>
	<script>
		alert("회원가입 성공");
		location.href="TM4.jsp";
	</script>
<% 
	pstmt.executeUpdate();
%>
</body>
</html>