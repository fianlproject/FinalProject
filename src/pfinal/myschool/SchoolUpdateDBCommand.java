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

public class SchoolUpdateDBCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
	
		
		String schoolmajor = req.getParameter("schoolmajor");
		String schoolstate = req.getParameter("schoolstate");
		String loginid = req.getParameter("loginid");
		String schoolname = req.getParameter("schoolname");
		String nowschoolnumber = req.getParameter("nowschoolnumber");

		switch (schoolstate) {
		case "1":
			schoolstate = "재학";
			break;
		case "2":
			schoolstate = "휴학";
			break;
		case "3":
			schoolstate = "졸업";
			break;
		}

		System.out.println("학교번호" + nowschoolnumber);
		System.out.println("로그인 아이디" + loginid);

		Connection con;
		PreparedStatement pstmt;
		ResultSet rs;
		DBConnectionMgr pool;
		String sql;

		sql = "UPDATE myschool set school_id=?, school_state=?, school_major=?, "
				+ "school_name=? where id='" + loginid + "' and school_id="+nowschoolnumber;

		System.out.println("업데이트"+sql);
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, Integer.parseInt(nowschoolnumber));
			pstmt.setString(2, schoolstate);
			pstmt.setString(3, schoolmajor);
			pstmt.setString(4, schoolname);

			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "school/school_Ok.jsp";

	}
}
