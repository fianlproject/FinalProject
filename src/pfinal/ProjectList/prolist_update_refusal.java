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

public class prolist_update_refusal implements Command {
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
		// 프리랜서측 최종승인 or 거절 버튼
		//0이 승인 1이 거절
		int check = Integer.parseInt(req.getParameter("check"));
		String pr_id = req.getParameter("pr_id"); 
		String app_id = req.getParameter("app_id"); 
		
		
		System.out.println("pr_id : "+pr_id);
		System.out.println("app : "+app_id);
		System.out.println("check : "+check);
		Vector pro = new Vector();
		String sql = null;
		try {

		pool = DBConnectionMgr.getInstance();
		con = pool.getConnection();
		
		if(check == 1){
			sql = "update app set check1 = ? , f_del = ? where app_id = ? and pr_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, 4);	
			pstmt.setInt(2, 1);	
			pstmt.setString(3, app_id);	
			pstmt.setString(4, pr_id);	
			pstmt.executeUpdate();
		}
		boolean upchk = false;
		if(check == 0){
			
			sql = "update app set fcheck = ? where app_id = ? and pr_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, 1);				
			pstmt.setString(2, app_id);	
			pstmt.setString(3, pr_id);	
			pstmt.executeUpdate();
			sql = "select pr_id from finish_project where pr_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pr_id);	
			rs = pstmt.executeQuery();
			if(rs.next()){
				upchk = true;
				System.out.println("업데이트");
			}
			if(upchk==true){
				sql = "select fr_id from runing_finish_project where pr_id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, pr_id);	
				rs = pstmt.executeQuery();
				rs.next();
				String fr_id = rs.getString("fr_id");				
				fr_id = fr_id + "," + app_id;
				sql = "update finish_project set fr_id = ? where pr_id = ?";
				pstmt = con.prepareStatement(sql);				
				pstmt.setString(1, fr_id);				
				pstmt.setString(2, pr_id);				
				pstmt.executeUpdate();
			}
			else if (upchk == false){
				sql = "insert into finish_project(pr_id,fr_id) values(?,?)";
				pstmt = con.prepareStatement(sql);				
				pstmt.setString(1, pr_id);				
				pstmt.setString(2, app_id);
				pstmt.executeUpdate();
			}
		}
		
		sql = "select cl_id , nday,nprice from app where pr_id = ? and app_id = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, pr_id);	
		pstmt.setString(2, app_id);
		rs = pstmt.executeQuery();
		rs.next();
		String cl_id = rs.getString("cl_id");
		int nday = rs.getInt("nday");
		String nprice = rs.getString("nprice");
		
		sql = "select pr_subject from list where pr_id = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, pr_id);
		rs = pstmt.executeQuery();
		rs.next();
		String pr_subject = rs.getString("pr_subject");
		
		sql = "insert into runing_finish_project(pr_id,fr_id,cl_id,pr_subject,fin_price,start_day,end_day)"
		+ " values(?,?,?,?,?,date_add(now(), interval +1 day),date_add(now(), interval +? day))";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, pr_id);	
		pstmt.setString(2, app_id);	
		pstmt.setString(3, cl_id);	
		pstmt.setString(4, pr_subject);	
		pstmt.setString(5, nprice);	
		pstmt.setInt(6, nday+1);	
		pstmt.executeUpdate();
		
		sql = "select pr_subject , pr_cntman ,a.pr_id,app_id,cl_con,hday,hprice,nday,nprice,check1,a.fcheck,readchk,a.cl_id,f_del from app a , list l where a.pr_id = l.pr_id and app_id=? and f_del = 0";
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
			dto.setFcheck(rs.getInt("a.fcheck"));
			dto.setReadchk(rs.getInt("readchk"));
			dto.setCl_id(rs.getString("a.cl_id"));
			dto.setF_del(rs.getInt("f_del"));
			pro.add(dto);		
		}
		req.setAttribute("prolist", pro);
				
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			pool.freeConnection(con, pstmt, rs);
		}
		req.setAttribute("check",check);		
		req.setAttribute("pr_id", pr_id);		
		
		return "pr_mypage/mypage_project/prolist.jsp";

	}
}
