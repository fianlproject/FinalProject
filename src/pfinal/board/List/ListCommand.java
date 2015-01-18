package pfinal.board.List;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kit.Command;
import kit.DBConnectionMgr;
import dto.checkDto;
import dto.listDto;

public class ListCommand implements Command {

	private int pr_id;

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DBConnectionMgr pool;
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		System.out.println("리스트 커맨드 통과");
		
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		String KeyWord = req.getParameter("keyWord");
		String KeyFiled = req.getParameter("keyField");
		System.out.println("리스트커맨드"+KeyWord);
		System.out.println("리스트커맨드"+KeyFiled);
		int start = 1;
		if(req.getParameter("start") != null){
			start = Integer.parseInt(req.getParameter("start"));
		}

		Vector v = new Vector();
		Vector vc=new Vector();
		listDto dto = new listDto();

		String sql;
		 
		if(KeyWord==null||KeyWord.isEmpty()){
			 sql = "select  pr_id,pr_subject,pr_skill,pr_content,pr_price,"
				+ "pr_start,pr_end,pr_needman,pr_cntman,c_name,pr_photo,cl_id,"
				+ "Floor((to_days(pr_end)-to_days(now()))/7) as week_cha, (to_days(pr_end)-to_days(now()))%7 as day_cha from list where pr_private='y' order by pr_id desc";
		}else{
			sql ="select  pr_id,pr_subject,pr_skill,pr_content,pr_price,"
				+ "pr_start,pr_end,pr_needman,pr_cntman,c_name,pr_photo,cl_id,"
				+ "Floor((to_days(pr_end)-to_days(now()))/7) as week_cha, (to_days(pr_end)-to_days(now()))%7 as day_cha from list where pr_private='y' "+ KeyFiled
					+" like '%"+ KeyWord + "%' order by pr_id";
		}
		
		try {

			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto = new listDto();

				dto.setPr_id(rs.getInt("pr_id"));
				dto.setPr_subject(rs.getString("pr_subject"));
				dto.setPr_skill(rs.getString("pr_skill"));
				dto.setPr_content(rs.getString("pr_content"));
				dto.setPr_price(rs.getString("pr_price"));
				dto.setPr_end(rs.getString("pr_end"));
				dto.setPr_start(rs.getString("pr_start"));
				dto.setPr_needman(rs.getInt("pr_needman"));
				dto.setPr_cntman(rs.getInt("pr_cntman"));
				dto.setC_name(rs.getString("c_name"));
				dto.setPr_skills(dto.getPr_skill().split(","));
				dto.setDay_cha(rs.getString("day_cha"));
				dto.setWeek_cha(rs.getString("week_cha"));
				dto.setCl_id(rs.getString("cl_id"));

				v.add(dto);
			}
			
			
			sql="select  pr_id, pr_end<now()+1 as check1 from list";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			checkDto dto1 = null;
			while(rs.next()){
				dto1 = new checkDto();
				dto1.setCheck123(rs.getString("check1"));
				dto1.setPr_id123(rs.getString("pr_id"));
				vc.add(dto1);
			}
			

			String[] ck= new String[vc.size()];
			String[] ck1=new String[vc.size()];
			for(int k=0;k<vc.size();k++){
				
				dto1 = (checkDto)vc.get(k);
				ck[k]=dto1.getCheck123();
				ck1[k]=dto1.getPr_id123();
	         }
			
				for(int i=0; i<ck.length; i++){
					if(ck[i].equals("1")){
						 pool = DBConnectionMgr.getInstance();
						con = pool.getConnection();
						sql="update list set pr_state='Y' where pr_id=?";
						 pstmt=con.prepareStatement(sql);
						 pstmt.setString(1, ck1[i]);
						 pstmt.executeUpdate();
					}
				}
			
		} catch (Exception err) {
			System.out.println("getlist() : " + err);
			err.printStackTrace();
		}
		finally{
			pool.freeConnection(con, pstmt, rs);
		}
		int size = v.size()/10+1; //블럭수
		
		int startpage = 1;
		int endpage = 10;
		if(start != 1){
			startpage = (start-1) * 10 + 1;
			endpage = (start-1) * 10 + 10;
		}
		
		req.setAttribute("aa", 123);
		req.setAttribute("dtoList", v);
		req.setAttribute("size", size);
		req.setAttribute("start", start);
		req.setAttribute("startpage", startpage);
		req.setAttribute("endpage", endpage);

		req.setAttribute("dtoList", v);
		return "pr_list/List.jsp";

	}
}
