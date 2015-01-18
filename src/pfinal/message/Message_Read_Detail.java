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

import dto.JoinDto;
import kit.Command;
import kit.DBConnectionMgr;

public class Message_Read_Detail implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("메시지 자세히 읽기");
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnectionMgr pool = null;
		String sql = null;

		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		int msg_id = Integer.parseInt(req.getParameter("msg_id"));
		Vector v = new Vector();
		Vector MsgList = new Vector();

		try {
			pool = DBConnectionMgr.getInstance();
			sql = "UPDATE message set read_status=1 WHERE msg_id="+msg_id+" and read_status=0";
			
			System.out.println(sql);
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
			
			sql = "SELECT * FROM members WHERE id IN( SELECT friend_id FROM friendlist WHERE invited=1 AND user_id= '"
					+ id
					+ "' ) AND id IN ( SELECT user_id FROM friendlist WHERE invited=1 AND friend_id= '"
					+ id + "') ORDER BY name";
			System.out.println(sql);

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				JoinDto dto = new JoinDto();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getInt("age"));
				dto.setTel(rs.getString("tel"));
				dto.setGender(rs.getInt("gender"));
				
				v.add(dto);
			}

			sql = "SELECT * FROM message WHERE msg_id="+msg_id;
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			req.setAttribute("msg_id", rs.getInt("msg_id"));
			req.setAttribute("receive_id", rs.getString("receive_id"));
			req.setAttribute("send_date", rs.getString("send_date"));
			req.setAttribute("send_id", rs.getString("send_id"));
			req.setAttribute("msg_contents", rs.getString("msg_contents"));
			req.setAttribute("read_status", rs.getInt("read_status"));
			req.setAttribute("privatepr_id", rs.getString("privatepr_id"));

			

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		req.setAttribute("vector", v);
		System.out.println("메시지 자세히 읽기 완료");
		return "/pr_message/Message_Read_Detail.jsp";
	}
}
