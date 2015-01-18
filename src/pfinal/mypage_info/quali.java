package pfinal.mypage_info;

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


public class quali implements Command {

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
		String id = (String)session.getAttribute("id");
		
		String q_name = req.getParameter("q_name");
		String q_house = req.getParameter("q_house");
		int q_num = Integer.parseInt(req.getParameter("q_num"));
		String q_date = req.getParameter("q_date");
		
		try{
			
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			sql = "insert into quali values(?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, q_name);
			pstmt.setString(2, q_house);
			pstmt.setInt(3, q_num);
			pstmt.setString(4, q_date);
			pstmt.setString(5, id);
			pstmt.executeUpdate();
			System.out.println(sql+"ÀÚ°ÝÁõ");
			
		}
		catch(Exception err){
			System.out.println("quali() : " +err);
			err.printStackTrace();
		}
		finally{
			pool.freeConnection(con, pstmt, rs);
		}
		
		return "free_index.jsp";
	}

}
