package pfinal.board.List;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kit.Command;
import kit.DBConnectionMgr;

public class Pr_SkillUpdateProc implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		
	
		String pr_id = req.getParameter("pr_id");
		
		String pr_skill = "";
		String[] pr_skills = req.getParameterValues("inter");

		for (int i = 0; i < pr_skills.length; i++) {
			pr_skill += pr_skills[i];
			if (i < pr_skills.length - 1) {
				pr_skill += ',';
			}
		}
	
		Connection con;
		PreparedStatement pstmt;
		ResultSet rs;
		DBConnectionMgr pool;
		String sql;

		sql = "UPDATE list set pr_skill='"+pr_skill+"' where pr_id='" + pr_id + "'";

		System.out.println("업데이트"+sql);
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
		
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "pr_list/Pr_Ok.jsp";

	}
}
