package pfinal.mypage_info;

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

public class career implements Command {
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
		
		
		try {

			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			sql = "insert into career values(?, ?, ?, ?, ?, ?)";            
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, cname);
	        pstmt.setString(2, part);
	        pstmt.setString(3, position);
	        pstmt.setString(4, id);
	        pstmt.setString(5, joins);
	        pstmt.setString(6, resign);
	        pstmt.executeUpdate();
			System.out.println(sql);
					
			

			
		} catch (Exception err) {
			System.out.println("getBoard() : " + err);
			err.printStackTrace();
		}
		finally{
			pool.freeConnection(con, pstmt, rs);
		}
		return "free_index.jsp";

	}
}
