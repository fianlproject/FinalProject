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

public class cl_prolist_update_final implements Command {
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
		
		String sub = (String) session.getAttribute("sub");
		String pr_id = req.getParameter("pr_id"); 
		String app_id = req.getParameter("app_id"); 
		String pr_subject = req.getParameter("pr_subject");
		String pr_price = req.getParameter("pr_price");
		
		System.out.println("asdasd"+id);
		System.out.println("aqq"+pr_id);
		Vector pro = new Vector();
		String sql = null;
		try {

		pool = DBConnectionMgr.getInstance();
		con = pool.getConnection();
		
		sql = "select * from finish_project where pr_id="+pr_id;
		System.out.println(sql);
		con = pool.getConnection();
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			String rs_fr_id = rs.getString("fr_id");
			String sum_id = rs_fr_id+","+app_id;
			sql="update finish_project set fr_id='"+sum_id+"' where pr_id="+pr_id;				
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		}else{
			sql = "insert into finish_project values ("+pr_id+",'"+app_id+"',0)";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		}
		
		sql = "insert into runing_finish_project values (?,?,?,?,?,now(),null,null,null,null,null,0,0)";
		System.out.println(sql);
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, pr_id);
		pstmt.setString(2, app_id);
		pstmt.setString(3, id);
		pstmt.setString(4, pr_subject);
		pstmt.setString(5, pr_price);
		pstmt.executeUpdate();
		System.out.println("runing¿¡ »ðÀÔ ¿Ï·á");
		
		sql = "update list set fcheck=1 where pr_id='"+pr_id+"'";
		pstmt = con.prepareStatement(sql);
		pstmt.executeUpdate();
		
		sql = "update app set fcheck = ? where app_id = ? and pr_id = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, 1);	
		pstmt.setString(2, app_id);	
		pstmt.setString(3, pr_id);	
		pstmt.executeUpdate();
		
		sql = "select pr_subject , a.pr_id,app_id,app_con,hday,hprice,nday,nprice,check1,a.fcheck,readchk from app a , list l where a.pr_id = l.pr_id and a.cl_id=? and pr_subject = ?";
		pstmt = con.prepareStatement(sql);			
		pstmt.setString(1, id);		
		pstmt.setString(2, sub);		
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			proDto dto = new proDto();
			dto.setPr_subject(rs.getString("pr_subject"));			
			dto.setPr_id(rs.getInt("pr_id"));
			dto.setApp_id(rs.getString("app_id"));
			dto.setApp_con(rs.getString("app_con"));
			dto.setHday(rs.getString("hday"));
			dto.setHprice(rs.getInt("hprice"));
			dto.setNday(rs.getString("nday"));
			dto.setNprice(rs.getInt("nprice"));
			dto.setCheck(rs.getInt("check1"));
			dto.setFcheck(rs.getInt("fcheck"));
			dto.setReadchk(rs.getInt("readchk"));
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
		return "pr_mypage/mypage_project/cl_prolist.jsp";

	}
}
