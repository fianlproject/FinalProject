package pfinal.mypage_info;

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

public class skill implements Command {

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
		
		String skill = req.getParameter("skill");
		int exp = Integer.parseInt(req.getParameter("exp"));
		int mastery = Integer.parseInt(req.getParameter("mastery"));
		
		System.out.println("exp 는" + exp + ", mastery는 " + mastery );
		
		try {

			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			
			sql = "select code from members where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();
			int code = rs.getInt("code");
			
			
			sql = "select skill from members where code ='"+code+"'";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			System.out.println("넣을 때 값 확인"+sql);
			
		
		
			boolean aaa = false;
			
			rs.next();
			String s = rs.getString("skill");
	
			
			System.out.println(s);
			
			if(s.equals("a")){
				sql = " UPDATE members SET skill = '"+skill+"' WHERE code='"+code+"'";

			}else if(!s.equals("a")){
				sql = " UPDATE members SET skill =  concat(skill, ',', '"+skill+"') WHERE code='"+code+"'";

			}

				System.out.println(sql);
				pstmt = con.prepareStatement(sql);
				pstmt.executeUpdate();
//멤버에 우선 넣어버려 ㅋ
			
				
			sql = "insert into skill(code, skill, exp, mastery, id) values(?, ?, ?, ?, ?)";           
	        pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, code);
	        pstmt.setString(2, skill);
	        pstmt.setInt(3, exp);
	        pstmt.setInt(4, mastery);
	        pstmt.setString(5, id);	    
	        pstmt.executeUpdate();
			System.out.println(sql);
					
		} catch (Exception err) {
			System.out.println("getBoard() : " + err);
			err.printStackTrace();
		}
		finally{
			pool.freeConnection(con, pstmt, rs);
		}
	
		return "free_index.jsp";

	}
}
