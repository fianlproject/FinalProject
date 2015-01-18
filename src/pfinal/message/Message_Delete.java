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
import dto.JoinDto;
import dto.MessageDto;

public class Message_Delete implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("message 읽기");
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnectionMgr pool = null;
		String sql = null;
		
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		String msg_ids = req.getParameter("msg_ids");
		
		String msg_id[] = msg_ids.split(",");
//		int []msg_id = null;
		
		Vector v = new Vector();
		Vector MsgList = new Vector();

		try{
			pool = DBConnectionMgr.getInstance();
			
			for(int i = 0 ; i < msg_id.length ; i++){
				sql = "DELETE FROM message WHERE msg_id IN ('" + msg_id[i] + "')";
				System.out.println(sql);
				con = pool.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.executeUpdate();
			}
			sql = "SELECT * FROM members WHERE id IN( SELECT friend_id FROM friendlist WHERE invited=1 AND user_id= '"
					+ id
					+ "' ) AND id IN ( SELECT user_id FROM friendlist WHERE invited=1 AND friend_id= '"
					+ id + "') ORDER BY name";
			System.out.println(sql);
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				JoinDto dto = new JoinDto();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getInt("age"));
				dto.setTel(rs.getString("tel"));
				dto.setGender(rs.getInt("gender"));
				v.add(dto);
			}
			
			sql = "SELECT * FROM message WHERE receive_id = '"+id+"' ORDER BY send_date desc";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MessageDto dto = new MessageDto();
				dto.setMsg_id(rs.getInt("msg_id"));
				dto.setReceive_id(rs.getString("receive_id"));
				dto.setSend_date(rs.getString("send_date"));
				dto.setSend_id(rs.getString("send_id"));
				dto.setMsg_content(rs.getString("msg_contents"));
				dto.setRead_status(rs.getInt("read_status"));
				MsgList.add(dto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			pool.freeConnection(con, pstmt, rs);
		}
		System.out.println(MsgList.size());
		req.setAttribute("vector", v);
		req.setAttribute("MsgList", MsgList);
		System.out.println("메시지 읽기 완료");
		return "/pr_message/Message_Read.jsp";
	}

}
