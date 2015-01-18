package pfinal.board.interest;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Iterator;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kit.Command;
import kit.DBConnectionMgr;
import dto.listDto;

public class InterListCommand implements Command {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DBConnectionMgr pool;
	@SuppressWarnings("null")
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		System.out.println("리스트 커맨드 통과");
		
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");

		String skill = null;
		Vector v = new Vector();
		Vector skill123 = new Vector();

		String sql;

		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		System.out.println("결과"+id);
		int start = 1;
		if(req.getParameter("start") != null){
			start = Integer.parseInt(req.getParameter("start"));
		}
		String inter[] = null;
		String inter1[] = null;
		String check[] = null;
		
		int count=1;
		try {

			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			sql = "select interest from members where id ='"+id+"'";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			System.out.println(sql);
			rs.next();
			String inters = rs.getString("interest");
			inter = inters.split(",");
		    System.out.println(inter[0]);
		   
		    
		    sql ="select pr_id , pr_skill from list";
		    System.out.println("이건."+sql);
		    pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			String pr_id; 
			while(rs.next()){
				pr_id = rs.getString("pr_id");
				skill = rs.getString("pr_skill");
				inter1 = skill.split(",");
				for(int i=0;i<inter.length;i++){
					System.out.println("i값 " +i);
					for(int j=0;j<inter1.length;j++){
						System.out.println("j값 " +j);
						System.out.println("i값 " +inter[i] + "j값" + inter1[j]);
						if(inter[i].equals(inter1[j])){
							System.out.println("결과임 " + pr_id);
							skill123.add(pr_id);
						}
					}
				}
			}//와일
			String inter2[] = new String[skill123.size()];  
			sql = "select * from list where";
			System.out.println(skill123+"11234");
			System.out.println(skill123.size());
	
			int size = skill123.size();
			for(int k=0;k<size;k++){
				inter2[k] = (String) skill123.get(k);
			}
			System.out.println("이거야" + inter2[0]);
			
			
			
			sql = "select fcheck,pr_id,pr_subject,pr_skill,pr_content,pr_price,"
					+ "pr_start,pr_end,pr_needman,pr_cntman,c_name,pr_photo,"
					+ "Floor((to_days(pr_end)-to_days(now()))/7) as week_cha, (to_days(pr_end)-to_days(now()))%7 as day_cha from list where ";
			for(int i=0;i<inter2.length;i++){
				if((i+1)==inter2.length){
					sql += " pr_id = "+inter2[i];
				}
				else{
					sql += " pr_id = "+inter2[i]+" or ";
				}
				System.out.println("정답"+inter2[i]);
			}
			
			 
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
						
			while (rs.next()) {
				listDto dto = new listDto();
				dto.setPr_id(rs.getInt("pr_id"));				
				dto.setPr_subject(rs.getString("pr_subject"));
				skill = rs.getString("pr_skill");
				dto.setPr_skill(skill);
				dto.setPr_content(rs.getString("pr_content"));
				dto.setPr_price(rs.getString("pr_price"));
				dto.setPr_end(rs.getString("pr_end"));
				dto.setPr_needman(rs.getInt("pr_needman"));
				dto.setPr_cntman(rs.getInt("pr_cntman"));
				dto.setC_name(rs.getString("c_name"));
				dto.setPr_skills(dto.getPr_skill().split(","));
				dto.setDay_cha(rs.getString("day_cha"));
				dto.setWeek_cha(rs.getString("week_cha"));
				dto.setFcheck(rs.getInt("fcheck"));
				v.add(dto);
			}
		} catch (Exception err) {
			System.out.println("getlist() : " + err);
			err.printStackTrace();
		}
		finally{
			pool.freeConnection(con, pstmt, rs);
		}
		int listSize = v.size();
		System.out.println("리스크 사이즈 : " + listSize);
		req.setAttribute("listSize", listSize);
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
		return "pr_list/Inter_List.jsp"; 

	}
}
