package pfinal.myschool;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kit.Command;
import kit.DBConnectionMgr;

public class SchoolInsertDBCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		
		int schoolnumber = Integer.parseInt(req.getParameter("schoolnumber"));
		String schoolmajor = req.getParameter("schoolmajor");
		String schoolstate = req.getParameter("schoolstate");
		String loginid = req.getParameter("loginid");
		String schoolname = req.getParameter("schoolname");

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

		System.out.println("학교번호" + schoolnumber);
		System.out.println("로그인 아이디" + loginid);

		Connection con;
		PreparedStatement pstmt;
		ResultSet rs;
		DBConnectionMgr pool;
		String sql;


		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			
			sql = "select code from members where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, loginid);
			rs = pstmt.executeQuery();
			rs.next();
			int code = rs.getInt("code");
			
			
			sql = "insert into myschool(code,school_id, id, school_state, school_major, school_name) values (?,?,?,?,?,?);";
			pstmt = con.prepareStatement(sql);
			
			
			pstmt.setInt(1, code);
			pstmt.setInt(2, schoolnumber);
			pstmt.setString(3, loginid);
			pstmt.setString(4, schoolstate);
			pstmt.setString(5, schoolmajor);
			pstmt.setString(6, schoolname);

			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "school/school_Ok.jsp";

	}
}
