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

public class career_up_out implements Command {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DBConnectionMgr pool;

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		String sql = null;
		
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		
		String cname = req.getParameter("cname");
		String part = req.getParameter("part");
		String position = req.getParameter("position");
		String joins = req.getParameter("joins");
		String resign = req.getParameter("resign");
		String career_index = req.getParameter("career_index");
		
		
		try {

			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			
			sql = "update career set cname = ? , part = ? , position = ? , joins = ? , resign =? where career_index = ?";
			
			// ¹Ø¿¡°Ç Áö¿ö
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();
			int code = rs.getInt("code");
			
			req.setAttribute("code", code);
			req.setAttribute("cname", cname);
			req.setAttribute("part", part);
			req.setAttribute("position", position);
			req.setAttribute("joins", joins);
			req.setAttribute("resign", resign);
			
			

			
		} catch (Exception err) {
			System.out.println("getBoard() : " + err);
			err.printStackTrace();
		}
		finally{
			pool.freeConnection(con, pstmt, rs);
		}
		return "pr_mypage/info_update/career_update.jsp";

	}
}
