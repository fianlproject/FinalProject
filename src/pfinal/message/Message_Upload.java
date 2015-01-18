package pfinal.message;

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

public class Message_Upload implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("업로드 시작");
		
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnectionMgr pool = null;
		String sql = null;
		
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		String receive_id = req.getParameter("friend_id");
		String msg_content = req.getParameter("msg_content"); 
		System.out.println(id+", "+receive_id+", "+msg_content);
		
		try {
			pool = DBConnectionMgr.getInstance();

			sql = "INSERT INTO message(send_id, receive_id, msg_contents, send_date, read_status) VALUES('"
					+id + "', '"+receive_id+ "', '"+ msg_content	+ "', now(), 0)";
			 System.out.println(sql);

			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (Exception err) {
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		System.out.println("업로드 완료");
		return null;
	}

}
