package pfinal.myschool;

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
import dto.mySchoolDto;

public class SchoolChkCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		String chk = "no";

		System.out.println("학교 DB체크" + id);

		Connection con;
		PreparedStatement pstmt;
		ResultSet rs;
		DBConnectionMgr pool;
		Vector v = new Vector();

		String sql = "select * from myschool where id='" + id + "'";

		System.out.println("학교 검색 sql " + sql);
		try {

			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			
				
				while (rs.next()) {
					chk = "yes";
					mySchoolDto dto = new mySchoolDto();
					dto.setSchoolname(rs.getString("school_name"));
					dto.setSchoolmajor(rs.getString("school_major"));
					dto.setSchoolstate(rs.getString("school_state"));
					dto.setSchoolid(rs.getInt("school_id"));
					v.add(dto);
					System.out.println();
				}
			


		} catch (Exception err) {
			System.out.println("DB체크() : " + err);
			err.printStackTrace();
		}

		req.setAttribute("SchoolChk", chk);
		req.setAttribute("mySchoolList", v);

		return "school/school_Chk.jsp";

	}
}
