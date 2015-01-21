package pfinal.mypage_info.update;

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

public class quali_up_in implements Command {
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
		
		String q_name = req.getParameter("q_name");
		String q_house = req.getParameter("q_house");
		String q_num = req.getParameter("q_num");
		String q_date = req.getParameter("q_date");
		String quali_index = req.getParameter("quali_index");
		
		
		try {

			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			
			
			req.setAttribute("q_name", q_name);
			req.setAttribute("q_house", q_house);
			req.setAttribute("q_num", q_num);
			req.setAttribute("q_date", q_date);
			req.setAttribute("quali_index", quali_index);
			
			
			

			
		} catch (Exception err) {
			System.out.println("getBoard() : " + err);
			err.printStackTrace();
		}
		finally{
			pool.freeConnection(con, pstmt, rs);
		}
		return "pr_mypage/info_update/quali_update.jsp";

	}
}
