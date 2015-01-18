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

public class SchoolInsertCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		

		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		String schoolnumber = req.getParameter("schoolnumber");
		String schoolname = req.getParameter("schoolname");
		HttpSession session = req.getSession();

		String id = (String) session.getAttribute("id");
		String chk = "";

		Connection con;
		PreparedStatement pstmt;
		ResultSet rs;
		DBConnectionMgr pool;

		String sql = "select * from myschool where id='" + id + "'";
		
		
		try {

			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
	

		} catch (Exception err) {
			System.out.println("DB체크() : " + err);
			err.printStackTrace();
		}
	
		System.out.println("학교번호"+schoolnumber);
		System.out.println("학교이름"+schoolname);
		

		req.setAttribute("schoolnumber", schoolnumber);
		req.setAttribute("schoolname", schoolname);
		req.setAttribute("schoolchk", chk);
		
		return "school/school_enter.jsp";

	}
}
