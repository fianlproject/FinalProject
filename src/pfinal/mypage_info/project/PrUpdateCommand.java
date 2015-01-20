package pfinal.mypage_info.project;

import java.io.IOException;
import java.rmi.ServerException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kit.Command;

public class PrUpdateCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServerException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");

		String pr_subject = req.getParameter("pr_subject");
		String pr_content = req.getParameter("pr_content");
		String pr_photo = req.getParameter("pr_photo");
		String pr_id = req.getParameter("pr_id");
		String pr_nowskill = req.getParameter("pr_nowskill");
		String pr_needman = req.getParameter("pr_needman");
		String pr_price = req.getParameter("pr_price");
		String pr_end = req.getParameter("pr_end");
		String pr_private = req.getParameter("pr_private");
		String pr_exday = req.getParameter("pr_exday");
		
		
		
		System.out.println("업데이트 커맨드 : " + pr_subject);
		System.out.println("업데이트 커맨드 : " + pr_content);
		System.out.println("업데이트 커맨드 : " + pr_photo);

		req.setAttribute("pr_subject", pr_subject);
		req.setAttribute("pr_content", pr_content);
		req.setAttribute("pr_photo", pr_photo);
		req.setAttribute("pr_id", pr_id);
		req.setAttribute("pr_nowskill", pr_nowskill);
		req.setAttribute("pr_needman", pr_needman);
		req.setAttribute("pr_price", pr_price);
		req.setAttribute("pr_end", pr_end);
		req.setAttribute("pr_private", pr_private);
		req.setAttribute("pr_exday", pr_exday);

		return "pr_list/Pr_Update.jsp";
	}

}
