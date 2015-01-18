package pfinal.board.Info;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kit.Command;
import kit.DBConnectionMgr;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dto.listDto;

public class GetBoardCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		System.out.println("겟보드통과");

		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		int pr_id = Integer.parseInt(req.getParameter("pr_id"));
		System.out.println("겟 보드 커맨드"+pr_id);
		
		String id = (String) session.getAttribute("id");
		System.out.println("현재 로그인 아이디 겟보드 "+ id);

		
		Connection con;
		PreparedStatement pstmt;
		ResultSet rs;
		DBConnectionMgr pool;
		listDto dto = new listDto();
		int day_cha = 0;

		String sql = "select pr_id,pr_subject,pr_skill,pr_content,pr_price,"
				+ "pr_start,pr_end,pr_needman,pr_cntman,c_name,pr_photo,longitude,latitude,pr_exday,cl_id,"
				+ "to_days(pr_end)-to_days(now()) as day_cha from list where pr_id=?";
		System.out.println("여기야"+sql); 
		try {

			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pr_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				String pr_skill = rs.getString("pr_skill");
				System.out.println(pr_skill);
				String pr_skills[] = pr_skill.split(",");
				
				for(int i=0; i<pr_skills.length;i++){
					System.out.println("겟보드"+pr_skills[i]);
				}

				dto.setPr_id(rs.getInt("pr_id"));
				dto.setPr_subject(rs.getString("pr_subject"));
				dto.setPr_skills(pr_skills);
				dto.setPr_content(rs.getString("pr_content"));
				dto.setPr_price(rs.getString("pr_price"));
				dto.setPr_start(rs.getString("pr_start"));
				dto.setPr_end(rs.getString("pr_end"));
				dto.setPr_needman(rs.getInt("pr_needman"));
				dto.setPr_cntman(rs.getInt("pr_cntman"));
				dto.setC_name(rs.getString("c_name"));
				dto.setPr_photo(rs.getString("pr_photo"));
				dto.setPr_skill(pr_skill);
				System.out.println(rs.getString("day_cha"));
				day_cha=Integer.parseInt(rs.getString("day_cha"));
				dto.setLongitude(rs.getString("longitude"));
				dto.setLatitude(rs.getString("latitude"));
				dto.setPr_exday(rs.getInt("pr_exday"));
				dto.setCl_id(rs.getString("cl_id"));
				
				session.setAttribute("longitude", rs.getString("longitude"));
				session.setAttribute("latitude", rs.getString("latitude"));
			}
			
			sql="select pr_end<now()+1 as check1 from list where pr_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pr_id);
			rs = pstmt.executeQuery();
			rs.next();
			int check = rs.getInt("check1");
		System.out.println(check+"11111111111111");
		
			if(check==1){
				System.out.println("YY로");
			 sql="update list set pr_state='Y' where pr_id=?";
			 pstmt=con.prepareStatement(sql);
			 pstmt.setInt(1, pr_id);
			 pstmt.executeUpdate();
			}
			
			sql="select pr_state from list where pr_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pr_id);
			rs = pstmt.executeQuery();
			rs.next();
			dto.setPr_state(rs.getString("pr_state"));
			
			System.out.println(dto.getPr_state()+"ddddddd");
			req.setAttribute("pr_state", dto.getPr_state());
			
			
		} catch (Exception err) {
			System.out.println("getBoard() : " + err);
			err.printStackTrace();
		}
		int week;
		int day;
		
		week=day_cha/7;
		day=day_cha%7;
		System.out.println(day+"get");
		
		session.setAttribute("week", week);
		session.setAttribute("day", day);
		req.setAttribute("dtoGetBoard", dto);
		
		
		return "pr_list/GetBoard.jsp";

	}
}
