package pfinal.mypage_info.update;

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

public class m_sogaeUpdate implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		Connection con;
		PreparedStatement pstmt;
		ResultSet rs;
		DBConnectionMgr pool;


		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");

		System.out.println("소개 업데이트"+id);
		
		String sql = "select sogae from members where id='" + id + "'";
		String nowsogae = null;
		try {

			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			nowsogae=rs.getString("sogae");
			
		} catch (Exception err) {
			System.out.println("getBoard() : " + err);
			err.printStackTrace();
		}
		
		System.out.println(nowsogae);
		req.setAttribute("nowsogae", nowsogae);
		
		return "pr_mypage/info/sogaeUpdate.jsp";
	}
}
