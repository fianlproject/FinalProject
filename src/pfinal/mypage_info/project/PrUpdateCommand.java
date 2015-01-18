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
		
		
		
		System.out.println("업데이트 커맨드 : " + pr_subject);
		System.out.println("업데이트 커맨드 : " + pr_content);
		System.out.println("업데이트 커맨드 : " + pr_photo);

		req.setAttribute("pr_subject", pr_subject);
		req.setAttribute("pr_content", pr_content);
		req.setAttribute("pr_photo", pr_photo);
		req.setAttribute("pr_id", pr_id);

		return "pr_list/Pr_Update.jsp";
	}

}
