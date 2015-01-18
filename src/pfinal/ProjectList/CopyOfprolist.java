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

public class CopyOfprolist implements Command {
	DBConnectionMgr pool = null;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {


		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
	
		Vector pro = new Vector();
		
		String sql = null;
		try {

		pool = DBConnectionMgr.getInstance();
		con = pool.getConnection();
		
		sql = "delete from app where f_del = 1 and cl_del=1";
		pstmt = con.prepareStatement(sql);		
		pstmt.executeUpdate();
		
		sql = "delete from app where f_del = 1 and readchk = 0";
		pstmt = con.prepareStatement(sql);		
		pstmt.executeUpdate();
		
		sql = "select pr_subject , pr_cntman ,a.pr_id,app_id,cl_con,hday,hprice,nday,nprice,check1,fcheck,readchk,a.cl_id,f_del from app a , list l where a.pr_id = l.pr_id and app_id=? and f_del = 0";
		pstmt = con.prepareStatement(sql);			
		pstmt.setString(1, id);		
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			proDto dto = new proDto();
			dto.setPr_subject(rs.getString("pr_subject"));
			dto.setPr_cntman(rs.getInt("pr_cntman"));
			dto.setPr_id(rs.getInt("a.pr_id"));
			dto.setApp_id(rs.getString("app_id"));
			dto.setCl_con(rs.getString("cl_con"));
			dto.setHday(rs.getString("hday"));
			dto.setHprice(rs.getInt("hprice"));
			dto.setNday(rs.getString("nday"));
			dto.setNprice(rs.getInt("nprice"));
			dto.setCheck(rs.getInt("check1"));
			dto.setFcheck(rs.getInt("fcheck"));
			dto.setReadchk(rs.getInt("readchk"));
			dto.setCl_id(rs.getString("a.cl_id"));
			dto.setF_del(rs.getInt("f_del"));
			pro.add(dto);		
		}
		
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			pool.freeConnection(con, pstmt, rs);
		}
		req.setAttribute("prolist", pro);
		return "pr_mypage/mypage_project/prolist.jsp";

	}
}
