package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bunge.dao.ChatDao;
import com.bunge.dao.DealingDao;

public class DirectDealSendFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
		request.setCharacterEncoding("utf-8");
		DealingDao dDao = new DealingDao();
		ChatDao cDao = new ChatDao();
		int productnumber_pk = 0;
		try {
			productnumber_pk = Integer.parseInt(request.getParameter("productnumber_pk"));
		} catch(NumberFormatException e) { }
		
		String sellerFk = request.getParameter("sellerFk");
		String imagename = request.getParameter("imagename");
		String productname = request.getParameter("productname");
		int price = Integer.parseInt(request.getParameter("price"));
		
		String dealingDate = request.getParameter("dealingDate");
		String directPlace = request.getParameter("directPlace");
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
		// 직거래요청
		cDao.insertChat(rno, NICKNAME_PK, "/;/직거래요청/;/");
		
		request.getRequestDispatcher("Controller?command=GoDirectDealCheck&rno="+rno+"&dno="+dno).forward(request, response);
		// 구매자가 판매자에게 직거래요청
		//opener.location.reload();
	}
}
