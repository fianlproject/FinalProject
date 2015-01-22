package pfinal.myschool;

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

public class SchoolDeleteDBCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");

		int schoolid =Integer.parseInt(req.getParameter("schoolid"));
		String myschool_index =req.getParameter("myschool_index");

		System.out.println("삭제 아이디:" + id + "삭제 학교 번호" + schoolid);

		Connection con;
		PreparedStatement pstmt;
		ResultSet rs;
		DBConnectionMgr pool;
		String sql;

		sql = "delete from myschool where id='" + id + "' and school_id="
				+ schoolid+" and myschool_index= "+myschool_index;
		System.out.println("삭제 sql : " + sql);

		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);

			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "school/school_Ok.jsp";

	}
}
