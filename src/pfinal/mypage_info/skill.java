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

public class skill implements Command {

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
		
		String skill = req.getParameter("skill");
		int exp = Integer.parseInt(req.getParameter("exp"));
		int mastery = Integer.parseInt(req.getParameter("mastery"));
		
		System.out.println("exp ´Â" + exp + ", mastery´Â " + mastery );
		
		
		try {

			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			
			sql = "select code from members where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();
			int code = rs.getInt("code");
			
			sql = "insert into skill values(?, ?, ?, ?, ?)";            
	        pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, code);
	        pstmt.setString(2, skill);
	        pstmt.setInt(3, exp);
	        pstmt.setInt(4, mastery);
	        pstmt.setString(5, id);	    
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
