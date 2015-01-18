package pfinal.ProjectList;

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

public class cl_up implements Command {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DBConnectionMgr pool;
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		

		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		
		System.out.println("왔어");
		String sql = null;
		Vector v = new Vector();
		HttpSession session = req.getSession();
		int pr_id = Integer.parseInt(req.getParameter("pr_id"));
		String id = (String) session.getAttribute("id");
		String content = req.getParameter("content");
		System.out.println(content+","+pr_id+","+id+" clup");
		boolean chk = false;
		String cl_id = null;
		try {

			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			
			sql = "select pr_price , pr_exday from list where pr_id=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pr_id);
			rs = pstmt.executeQuery();
			rs.next();
			String nday = rs.getString("pr_exday");
			int nprice = rs.getInt("pr_price");
			String check = req.getParameter("check");
			if(req.getParameter("nday") != null){
				nday = req.getParameter("nday");
				nprice = Integer.parseInt(req.getParameter("nprice"));
				System.out.println("clup"+nday+","+nprice);
			}
			System.out.println("이거"+id);
			sql = "update app set nday = ? , nprice = ? , cl_con = ? where pr_id=? and cl_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, nday);
			pstmt.setInt(2,nprice);
			pstmt.setString(3,content);
			pstmt.setInt(4, pr_id);
			pstmt.setString(5,id);
			pstmt.executeUpdate();
			
			System.out.println("이거"+ chk);
			
		} catch (Exception err) {
			System.out.println("getBoard() : " + err);
			err.printStackTrace();
		}
		finally{
			pool.freeConnection(con, pstmt, rs);
		}
			return "client_index.jsp";

	}
}
