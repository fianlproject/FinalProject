package pfinal.join;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kit.Command;

public class Join implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("Åë°ú");
		HttpSession session = req.getSession();
		session.setAttribute("join", "join");
		return "/pr_join/Join.jsp";
	}
}
