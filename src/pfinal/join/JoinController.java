package pfinal.join;

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
import kit.Encode;

public class JoinController implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnectionMgr pool = null;

		int cpcheck = Integer.parseInt(req.getParameter("cpcheck"));
		int cage = 0;
		int fgender=0;
		int pgender=0;
		
		String pw = req.getParameter("pw"); 
		
		pw = Encode.encrypt(pw);

		if(req.getParameter("gender") != null){
			if (Integer.parseInt(req.getParameter("gender")) == 0){
				fgender = 0;
			}else if(Integer.parseInt(req.getParameter("gender")) == 1){
				fgender = 1;
			}else {
				pgender=2;
			}
		};
		String cname = null;
		
		// 회사일경우
		if (cpcheck == 1) {
			String sql = "";
			try {
				pool = DBConnectionMgr.getInstance();
				con = pool.getConnection();

				sql = "INSERT INTO members VALUES(?,?,?,?,?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, req.getParameter("id"));
				pstmt.setString(2, pw);
				pstmt.setString(3, req.getParameter("name"));
				pstmt.setInt(4, Integer.parseInt(req.getParameter("cpcheck")));
				pstmt.setInt(5, cage);
				pstmt.setString(6, req.getParameter("cname"));
				pstmt.setString(7, req.getParameter("tel"));
				pstmt.setInt(8, pgender);
				pstmt.setInt(9, 0);
				pstmt.setString(10, "");
				pstmt.setInt(11, 1);
				pstmt.executeUpdate();

			} catch (Exception e) {
				System.out.println("회원가입 오류 : " + e);
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			
		}// 개인일 경우
		else{ 
			String sql = "";
			try {
				pool = DBConnectionMgr.getInstance();
				con = pool.getConnection();

				sql = "INSERT INTO members VALUES(?,?,?,?,?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, req.getParameter("id"));
				pstmt.setString(2, pw);
				pstmt.setString(3, req.getParameter("name"));
				pstmt.setInt(4, Integer.parseInt(req.getParameter("cpcheck")));
				pstmt.setInt(5, Integer.parseInt(req.getParameter("age")));
				pstmt.setString(6, cname);
				pstmt.setString(7, req.getParameter("tel"));
				pstmt.setInt(8, fgender);
				pstmt.setInt(9, 0);
				pstmt.setString(10, "");
				pstmt.setInt(11, 1);
				pstmt.executeUpdate();
				

			} catch (Exception e) {
				System.out.println("회원가입 오류 : " + e);
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
		}

		System.out.println("회원가입성공");
		return "index.jsp";
	}

}
