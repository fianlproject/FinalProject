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
import dto.proDto;

public class cl_prolist_test implements Command {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DBConnectionMgr pool;

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		

		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		
		System.out.println("asdasd"+id);
		Vector pro = new Vector();
		String sql = null;
		try {

		pool = DBConnectionMgr.getInstance();
		con = pool.getConnection();
		
		
		
		sql = "select pr_subject , pr_cntman from list where cl_id = '"+id+"'";
		System.out.println("cl_prolist_test : " + sql);
		pstmt = con.prepareStatement(sql);			
//		pstmt.setString(1, id);		
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			proDto dto = new proDto();
			dto.setPr_subject(rs.getString("pr_subject"));
			dto.setPr_cntman(rs.getInt("pr_cntman"));	
			pro.add(dto);		
		}
		
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			pool.freeConnection(con, pstmt, rs);
		}
		System.out.println("내 프로젝트 사이즈 : " +pro.size());
		req.setAttribute("prolist", pro);
		return "pr_mypage/mypage_project/cl_prolist_test.jsp";

	}
}
