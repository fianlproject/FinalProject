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

public class Message_Write implements Command {

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
		Vector v = new Vector();
		
		try{
		pool = DBConnectionMgr.getInstance();

		sql = "SELECT * FROM members WHERE id IN( SELECT friend_id FROM friendlist WHERE invited=1 AND user_id= '"
				+ id + "' ) AND id IN ( SELECT user_id FROM friendlist WHERE invited=1 AND friend_id= '"+ id +"') ORDER BY name";
		System.out.println(sql);
		con = pool.getConnection();
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
			System.out.println(v.size());
		}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			pool.freeConnection(con, pstmt, rs);
		}
		System.out.println(v.size());
		req.setAttribute("vDto", v);
		System.out.println("메시지 쓰기 통과");
		
		return "/pr_message/Message_Write_Detail.jsp";
	}

}
