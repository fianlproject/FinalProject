package pfinal.ProjectList;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kit.Command;
import kit.DBConnectionMgr;
import dto.listDto;

public class cl_agree implements Command {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DBConnectionMgr pool;
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		

		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		
		System.out.println("¿Ô¾î");
		String sql = null;
		Vector v = new Vector();
		HttpSession session = req.getSession();
		int pr_id = Integer.parseInt(req.getParameter("pr_id"));
		String app_id = req.getParameter("app_id");
		String id = (String) session.getAttribute("id");
		
		req.setAttribute("pr_id",pr_id);
		req.setAttribute("app_id",app_id);		
		
			return "pr_mypage/mypage_project/cl_prolist_agree.jsp";

	}
}
