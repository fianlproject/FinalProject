package pfinal.message;

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

public class Message_Write_Detail implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("메시지 쓰기 이동");
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnectionMgr pool = null;
		String sql = null;
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		String send_id = req.getParameter("friend_id");
		Vector v = new Vector();
		try{
			pool = DBConnectionMgr.getInstance();

			sql = "SELECT * FROM members WHERE id = '"+send_id+"'";
			System.out.println(sql);
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			req.setAttribute("send_id", rs.getString("id"));
			req.setAttribute("send_name",rs.getString("name"));
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			pool.freeConnection(con, pstmt, rs);
		}
		System.out.println(send_id);
//		req.setAttribute("send_id", send_id);
		
		System.out.println("메시지 쓰기 통과");
		
		return "/pr_message/Message_Write_Detail.jsp";
	}

}
