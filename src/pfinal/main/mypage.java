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
import dto.listDto;

public class mypage implements Command {

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
		String inter = null;
		String inters[] = null;
		Vector inters2 = new Vector();
		try {

			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			sql = "select interest from members " +" where id ='"+id+"'";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);			
			rs = pstmt.executeQuery();
			
			rs.next();
			inter = rs.getString("interest");
			
			inters = inter.split(",");
			
			for(int i=0;i<inters.length;i++){
				inters2.add(inters[i]);
			}
			
			session.setAttribute("list", inters2);
						
		} catch (Exception err) {
			System.out.println("getBoard() : " + err);
			err.printStackTrace();
		}
		finally{
			pool.freeConnection(con, pstmt, rs);
		}
		
		return "pr_mypage/mypage.jsp";

	}
}
