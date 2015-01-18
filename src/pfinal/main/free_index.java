package pfinal.main;

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
import dto.MessageDto;
import dto.ProjectDto;
public class free_index implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("Åë°ú");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnectionMgr pool = null;
		String sql = null;
		Vector v = new Vector();
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		System.out.println(id);
		ProjectDto dto = null;
		boolean flag = false;
		Vector msg = new Vector();
		int count = 0;
		try {
			pool = DBConnectionMgr.getInstance();

			sql = "select * from f_projects where id=?";
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto = new ProjectDto();
				dto.setTitle(rs.getString("title"));
				dto.setCategory(rs.getString("category"));
				dto.setCategory_sub(rs.getString("category_sub"));
				dto.setContents(rs.getString("contents"));
				dto.setStart(rs.getString("start"));
				dto.setEnd(rs.getString("end"));
				dto.setMain_image(rs.getString("main_image"));
				dto.setSub_image(rs.getString("sub_image"));
				dto.setCaption(rs.getString("caption"));
				dto.setParticipation_rate(rs.getInt("participation_rate"));
				dto.setId(rs.getString("id"));
				dto.setTag(rs.getString("tag"));
				System.out.println("e");
				v.add(dto);
				flag = true;
			}
			
			sql = "SELECT * FROM message WHERE receive_id ='"+id+"' and read_status=0";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				MessageDto msgdto = new MessageDto();
				msgdto.setRead_status(rs.getInt("read_status"));
				msg.add(dto);
				System.out.println(msg.size());
				count = msg.size();
			}

		} catch (Exception err) {
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		req.setAttribute("vector", v);
		req.setAttribute("flag", flag);
		req.setAttribute("msg", count);
		return "free_index.jsp";
	}

}
