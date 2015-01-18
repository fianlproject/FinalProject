package pfinal.Project.RF;

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
import dto.rfDto;

public class RF_Project_List implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		System.out.println("리스트 커맨드 통과");
		
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
//		String KeyWord = req.getParameter("keyWord");
//		String KeyFiled = req.getParameter("keyField");
//		System.out.println("리스트커맨드"+KeyWord);
//		System.out.println("리스트커맨드"+KeyFiled);
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		
				
		Vector v = new Vector();
		Vector frv = new Vector();
		rfDto dto = null;
//		rfDto frdto = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnectionMgr pool = null;
		String sql;
		boolean flag1=false;
		boolean flag2=false;
		try {

			pool = DBConnectionMgr.getInstance();
			sql = "select pr_id, fr_id, cl_id, fin_price, start_day, end_day,evaluate, pr_comment, pr_status, pr_subject, "
					+ "(to_days(end_day)-to_days(start_day))as total, count(pr_id)as fr_id_count, sum(fin_price)as total_price From runing_finish_project "
					+ "WHERE cl_id ='"+id+"' and pr_status=0 group by pr_id order by pr_id desc ";
			System.out.println(sql);
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				dto = new rfDto();
				dto.setPr_id(rs.getInt("pr_id"));
				dto.setCl_id(rs.getString("cl_id"));
				dto.setFin_price(rs.getString("fin_price"));
				dto.setStart_day(rs.getString("start_day"));
				dto.setEnd_day(rs.getString("end_day"));
				dto.setTotal_day(rs.getInt("total"));
				dto.setEvaluate(rs.getString("evaluate"));
				dto.setComment(rs.getString("pr_comment"));
				dto.setPr_status(rs.getInt("pr_status"));
				dto.setPr_subject(rs.getString("pr_subject"));
				dto.setFr_ids(rs.getString("fr_id_count"));
				dto.setTotal_price(rs.getString("total_price"));
//				dto.setFcheck(rs.getString("fcheck"));
				v.add(dto);
			}
			
			sql = "select pr_id, fr_id, cl_id, fin_price, start_day, end_day,evaluate, pr_comment, pr_status, pr_subject, "
					+ "(to_days(end_day)-to_days(start_day))as total, count(pr_id)as fr_id_count, sum(fin_price)as total_price From runing_finish_project "
					+ "WHERE cl_id ='"+id+"' and pr_status=1 group by pr_id order by pr_id desc ";
			System.out.println(sql);
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				dto = new rfDto();
				dto.setPr_id(rs.getInt("pr_id"));
				dto.setCl_id(rs.getString("cl_id"));
				dto.setFin_price(rs.getString("fin_price"));
				dto.setStart_day(rs.getString("start_day"));
				dto.setEnd_day(rs.getString("end_day"));
				dto.setTotal_day(rs.getInt("total"));
				dto.setEvaluate(rs.getString("evaluate"));
				dto.setComment(rs.getString("pr_comment"));
				dto.setPr_status(rs.getInt("pr_status"));
				dto.setPr_subject(rs.getString("pr_subject"));
				dto.setFr_ids(rs.getString("fr_id_count"));
				dto.setTotal_price(rs.getString("total_price"));
//				dto.setFcheck(rs.getString("fcheck"));
				frv.add(dto);
			}
			
			
		} catch (Exception err) {
			System.out.println("getlist() : " + err);
			err.printStackTrace();
		}finally{
			pool.freeConnection(con, pstmt, rs);
		}
		req.setAttribute("count", v.size());
		req.setAttribute("dtoList1", v);
		req.setAttribute("dtoList2", frv);
//		req.setAttribute("frdto", frv);
		System.out.println("리스트 블러오기 완료");
		return "pr_running_finish/RF_Project_List.jsp";

	}
}
