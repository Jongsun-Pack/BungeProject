package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bunge.dao.ReviewDao;

public class ReviewWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		ReviewDao rDao = new ReviewDao();
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

		//location.href="TalkMainScreen3.jsp?rno=" + rno + '&dno=' + dno + '&sellerFk=' + sellerFk;
		//alert("후기작성이 완료되었습니다");
		request.getRequestDispatcher("Controller?command=GoMainTalk").forward(request, response);
	}
}
