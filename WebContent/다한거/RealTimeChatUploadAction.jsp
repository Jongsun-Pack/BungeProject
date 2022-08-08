<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="com.bunge.dao.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>채팅보내기</title>
	<%
		request.setCharacterEncoding("utf-8");
		
		String path = request.getRealPath("upload");	// 절대경로
	    System.out.println("(참고) real path : " + path);
	    
	    // upload 폴더가 없으면 만듦. --------------------------
	    File filePath = new File(path);
	    if(filePath.exists()==false) {
	    	filePath.mkdirs();
	    }
	    // ------------------------------------------------
	    
		int sizeLimit = 100*1024*1024;		//100MB 제한
		
		MultipartRequest multi = new MultipartRequest(request, path, sizeLimit, "UTF-8",
	                               	                new DefaultFileRenamePolicy() );
		
		// 파일 저장 끝. 이제 파일에 대한 정보(파일이름)를 multi객체로부터 뽑아내서 사용.		
		Enumeration files = multi.getFileNames();
		String fileObject1 = (String)(files.nextElement());
		String filename1 = multi.getFilesystemName(fileObject1);
		//System.out.println("업로드 완료 - 파일명 : " + filename1);

		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
		int rno = 0;
		try {
			rno = Integer.parseInt(multi.getParameter("rno"));
		} catch(Exception e) { }
		int dno = 0;
		try {
			dno = Integer.parseInt(multi.getParameter("dno"));
		} catch(Exception e) { }
		ChatDao chatDao = new ChatDao();
		chatDao.insertChatUpload(rno, NICKNAME_PK, filename1);
	%>
</head>
<body>
	<script>
		location.href="TalkMainScreen3.jsp?rno=<%=rno%>&dno=<%=dno%>";
 	</script>
</body>
</html>