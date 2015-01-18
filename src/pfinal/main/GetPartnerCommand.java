package pfinal.main;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kit.Command;
import dto.listDto;

public class GetPartnerCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		System.out.println("겟보드통과");

		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		String mid = req.getParameter("id");
	
		System.out.println("파트너겟 보드 커맨드"+mid);
		
		
		
//		Connection con;
//		PreparedStatement pstmt;
//		ResultSet rs;
//		DBConnectionMgr pool;
//		listDto dto = new listDto();
//		int day_cha = 0;
//
//		String sql = "select pr_id,pr_subject,pr_skill,pr_content,pr_price,"
//				+ "pr_start,pr_end,pr_needman,pr_cntman,c_name,pr_photo,"
//				+ "to_days(pr_end)-to_days(pr_start) as day_cha from list where pr_id=?";
//		System.out.println("여기야"+sql); 
//		try {
//
//			pool = DBConnectionMgr.getInstance();
//			con = pool.getConnection();
//			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, pr_id);
//			rs = pstmt.executeQuery();
//
//			while (rs.next()) {
//				String pr_skill = rs.getString("pr_skill");
//				System.out.println(pr_skill);
//				String pr_skills[] = pr_skill.split(",");
//				
//				for(int i=0; i<pr_skills.length;i++){
//					System.out.println("겟보드"+pr_skills[i]);
//				}
//				
//	//			String pr_skills = pr_skill.
////				Vector pr_skills = new Vector();
////				pr_skills.add(pr_skill.split(","));
////						//=pr_skill.split(",");
////				pr_skills.get(0);
//
//
//				dto.setPr_id(rs.getInt("pr_id"));
//				dto.setPr_subject(rs.getString("pr_subject"));
//				dto.setPr_skills(pr_skills);
//				dto.setPr_content(rs.getString("pr_content"));
//				dto.setPr_price(rs.getString("pr_price"));
//				dto.setPr_start(rs.getString("pr_start"));
//				dto.setPr_end(rs.getString("pr_end"));
//				dto.setPr_needman(rs.getInt("pr_needman"));
//				dto.setPr_cntman(rs.getInt("pr_cntman"));
//				dto.setC_name(rs.getString("c_name"));
//				dto.setPr_photo(rs.getString("pr_photo"));
//				dto.setPr_skill(pr_skill);
//				System.out.println(rs.getString("day_cha"));
//				day_cha=Integer.parseInt(rs.getString("day_cha"));
//				
//
//			}
//		} catch (Exception err) {
//			System.out.println("getBoard() : " + err);
//			err.printStackTrace();
//		}
//		int week;
//		int day;
//		
//		week=day_cha/7;
//		day=day_cha%7;
//		
//		session.setAttribute("week", week);
//		session.setAttribute("day", day);
//		req.setAttribute("dtoGetBoard", dto);
		req.setAttribute("dtoGetPartner", mid);
		
		return "pr_list/GetPartner.jsp";

	}
}
