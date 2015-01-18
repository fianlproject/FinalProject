package pfinal.myschool;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kit.Command;
import kit.DBConnectionMgr;
import dto.schoolDto;

public class SchoolUpdateResultCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		System.out.println("겟보드통과");

		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		String schoolname = req.getParameter("schoolname");
		String nowschoolnumber = req.getParameter("nowschoolnumber");
		

		System.out.println("학교검색 커맨드" + schoolname+", "+nowschoolnumber);
		

		Connection con;
		PreparedStatement pstmt;
		ResultSet rs;
		DBConnectionMgr pool;
		schoolDto sdto = new schoolDto();
		Vector schoolv = new Vector();
		String schoolchk = "no";

		String sql = "select number, address, name, type from school where name like '%"
				+ schoolname + "%' order by type desc";

		System.out.println("학교 검색 sql " + sql);
		try {

			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				schoolchk="yes";
				sdto = new schoolDto();
				sdto.setName(rs.getString("name"));
				sdto.setNumber(rs.getInt("number"));
				sdto.setAddress(rs.getString("address"));
				sdto.setType(rs.getString("type"));
				schoolv.add(sdto);

			}
		} catch (Exception err) {
			System.out.println("getBoard() : " + err);
			err.printStackTrace();
		}

		req.setAttribute("schoolUpdateResult", schoolv);
		req.setAttribute("schoolResultChk", schoolchk);
		req.setAttribute("nowschoolnumber", nowschoolnumber);

//		return "school/school_UpdateResult.jsp";
		return "school/school_UpdateSearch.jsp";

	}
}
