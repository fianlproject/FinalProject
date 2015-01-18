package pfinal.friend;

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

public class Friend_add implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		DBConnectionMgr pool=null;
		
		HttpSession session = req.getSession();
		
		String id = (String)session.getAttribute("id");
		String fid = (String)req.getParameter("fid");
		System.out.println("模备格废"+id+","+fid);
		
		Vector v = new Vector();
		Vector frv = new Vector();
		// System.out.println(sql);
		try {
			pool = DBConnectionMgr.getInstance();
			String sql1 = "INSERT INTO friendlist VALUES('" + id + "', '"
					+ fid + "', 1)";
			String sql2 = "INSERT INTO friendlist VALUES('" + fid + "', '"
					+ id + "', 0)";
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql1);
			pstmt.executeUpdate();

			pstmt = con.prepareStatement(sql2);
			pstmt.executeUpdate();
			
			String sql = "SELECT * FROM members WHERE id IN ("
					+ "SELECT friend_id FROM friendlist "
					+ "WHERE (invited=1 AND user_id = '" + id
					+ "')) ORDER BY name";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				JoinDto dto = new JoinDto();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getInt("age"));
				dto.setTel(rs.getString("tel"));
				dto.setGender(rs.getInt("gender"));
				// System.out.println(dto.getId());
				v.add(dto);
			}

			// 模备脚没 格废
			sql = "SELECT * FROM members WHERE id IN (select friend_id from friendlist where invited=0 AND user_id='"
					+ id + "')";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				JoinDto dto = new JoinDto();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getInt("age"));
				dto.setTel(rs.getString("tel"));
				dto.setGender(rs.getInt("gender"));
				// System.out.println(dto.getMember_id());
				frv.add(dto);
			}

		} catch (Exception err) {
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		req.setAttribute("vector", v);
		req.setAttribute("frvector", frv);

		return "/pr_friends/Friend_List.jsp";
	}

}
