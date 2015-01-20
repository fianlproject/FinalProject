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

public class media implements Command {
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
		
		
		String ui =  (String) req.getParameter("ui");
		System.out.println(ui+"asd");
		
		try {

			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			sql = "update members set media ='"+ ui +"' where id ='"+id+"'";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);			
			pstmt.executeUpdate();
			
			System.out.println("??????????????????");
			sql = "SELECT media_rss,media_name from media where media_num = ?";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ui);
			rs = pstmt.executeQuery();
			rs.next();
			String rss = rs.getString("media_rss");
			String media_name = rs.getString("media_name");			
			session.setAttribute("rss" , rss);
			session.setAttribute("media_name" , media_name);
			
			
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
