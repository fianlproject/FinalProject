package pfinal.board.Info;

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

public class up implements Command {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DBConnectionMgr pool;
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		

		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		
		System.out.println("왔어");
		String sql = null;
		Vector v = new Vector();
		HttpSession session = req.getSession();
		int pr_id = Integer.parseInt(req.getParameter("pr_id"));
		String id = (String) session.getAttribute("id");
		String hday = req.getParameter("hday");
		int hprice = Integer.parseInt(req.getParameter("hprice"));
		String content = req.getParameter("content");
		boolean chk = false;
		String cl_id = null;
		int pr_exday = 0;
		int pr_price = 0;
		try {

			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			
			System.out.println("이거"+id);
			sql = "select app_id from app where pr_id=? and app_id = ?";
			pstmt = con.prepareStatement(sql);	
			pstmt.setInt(1, pr_id);
			pstmt.setString(2,id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				chk = true;
			}
			System.out.println("이거"+ chk);
			if(chk == false){
				sql = "update list set pr_cntman = pr_cntman + 1 where pr_id ="+pr_id;
				pstmt = con.prepareStatement(sql);			
				pstmt.executeUpdate();
				
				sql = "select cl_id,pr_exday,pr_price from list where pr_id="+pr_id;
				pstmt = con.prepareStatement(sql);			
				rs = pstmt.executeQuery();				
				rs.next();
				cl_id = rs.getString("cl_id");
				pr_exday = rs.getInt("pr_exday");
				pr_price = rs.getInt("pr_price");
				
				
				
				sql = "insert into app values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);	
				pstmt.setInt(1, pr_id);
				pstmt.setString(2,id);
				pstmt.setString(3,content);
				pstmt.setString(4,hday);
				pstmt.setInt(5,hprice);
				pstmt.setInt(6,pr_exday);
				pstmt.setInt(7,pr_price);
				pstmt.setInt(8,0);
				pstmt.setInt(9,0);
				pstmt.setInt(10,0);
				pstmt.setString(11,cl_id);
				pstmt.setString(12,null);
				pstmt.setInt(13,0);
				pstmt.setInt(14,0);
				pstmt.executeUpdate();				
				System.out.println("안되나");
			}
			
		} catch (Exception err) {
			System.out.println("getBoard() : " + err);
			err.printStackTrace();
		}
		finally{
			pool.freeConnection(con, pstmt, rs);
		}

		String KeyWord = req.getParameter("keyWord");
		String KeyFiled = req.getParameter("keyField");
		
		if(KeyWord==null||KeyWord.isEmpty()){
			 sql = "select  pr_id,pr_subject,pr_skill,pr_content,pr_price,"
				+ "pr_start,pr_end,pr_needman,pr_cntman,c_name,pr_photo,"
				+ "Floor((to_days(pr_end)-to_days(pr_start))/7) as week_cha, (to_days(pr_end)-to_days(pr_start))%7 as day_cha from list order by pr_id desc";
		}else{
			sql ="select  pr_id,pr_subject,pr_skill,pr_content,pr_price,"
				+ "pr_start,pr_end,pr_needman,pr_cntman,c_name,pr_photo,"
				+ "Floor((to_days(pr_end)-to_days(pr_start))/7) as week_cha, (to_days(pr_end)-to_days(pr_start))%7 as day_cha from list where "+ KeyFiled
					+" like '%"+ KeyWord + "%' order by pr_id";
		}
		
		try {

			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				listDto dto = new listDto();

				dto.setPr_id(rs.getInt("pr_id"));
				dto.setPr_subject(rs.getString("pr_subject"));
				dto.setPr_skill(rs.getString("pr_skill"));
				dto.setPr_content(rs.getString("pr_content"));
				dto.setPr_price(rs.getString("pr_price"));
				dto.setPr_start(rs.getString("pr_start"));
				dto.setPr_end(rs.getString("pr_start"));
				dto.setPr_needman(rs.getInt("pr_needman"));
				dto.setPr_cntman(rs.getInt("pr_cntman"));
				dto.setC_name(rs.getString("c_name"));
				dto.setDay_cha(rs.getString("day_cha"));
				dto.setWeek_cha(rs.getString("week_cha"));
				v.add(dto);
			}
		} catch (Exception err) {
			System.out.println("getlist() : " + err);
			err.printStackTrace();
		}
		finally{
			pool.freeConnection(con, pstmt, rs);
		}

		req.setAttribute("dtoList", v);
		
		System.out.println("간다");
		if(chk)
			return "pr_list/true_List.jsp";
		else
			return "pr_list/List.jsp";

	}
}
