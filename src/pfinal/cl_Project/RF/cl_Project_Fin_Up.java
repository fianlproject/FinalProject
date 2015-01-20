package pfinal.cl_Project.RF;

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

public class cl_Project_Fin_Up implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		System.out.println("프로젝트 완료 완료!!");

		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		DBConnectionMgr pool=null;
		
		String sql;
		String pr_id = req.getParameter("pr_id");
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		Vector v = new Vector();
		Vector frv = new Vector();
		rfDto dto = null;
		boolean flag1=false;
		boolean flag2=false;
		try{
			
			pool = DBConnectionMgr.getInstance();
			
			sql= "update finish_project set pr_status=1 where pr_id="+pr_id;
			System.out.println("finish_project_업 : "+sql);
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
			
			sql = "update runing_finish_project set pr_status=1, end_day=now() where pr_id="+pr_id;
			System.out.println("runing_finish_project_업 : "+sql);
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
			
			sql = "select pr_id, fr_id, cl_id, fin_price, start_day, end_day, fr_evaluate, fr_pr_comment, pr_status, pr_subject, cl_evaluate, cl_pr_comment,"
					+ "(to_days(end_day)-to_days(start_day))as total, count(pr_id)as fr_id_count, sum(fin_price)as total_price From runing_finish_project "
					+ "WHERE cl_id ='"+id+"' and pr_status=0 group by pr_id order by pr_id desc ";
			
			System.out.println("다시 불러오기: "+sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto = new rfDto();
				dto.setPr_id(rs.getInt("pr_id"));
				dto.setFr_id(rs.getString("fr_id"));
				dto.setCl_id(rs.getString("cl_id"));
				dto.setFin_price(rs.getString("fin_price"));
				dto.setStart_day(rs.getString("start_day"));
				dto.setEnd_day(rs.getString("end_day"));
				dto.setTotal_day(rs.getInt("total"));
				dto.setFr_evaluate(rs.getString("fr_evaluate"));
				dto.setFr_comment(rs.getString("fr_pr_comment"));
				dto.setCl_evaluate(rs.getString("cl_evaluate"));
				dto.setCl_comment(rs.getString("cl_pr_comment"));
				dto.setPr_status(rs.getInt("pr_status"));;
				dto.setPr_subject(rs.getString("pr_subject"));
				dto.setFr_ids(rs.getString("fr_id_count"));
				dto.setTotal_price(rs.getString("total_price"));
				
				v.add(dto);
			}
			sql = "select pr_id, fr_id, cl_id, fin_price, start_day, end_day, fr_evaluate, fr_pr_comment, pr_status, pr_subject, cl_evaluate, cl_pr_comment,"
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
				dto.setFr_evaluate(rs.getString("fr_evaluate"));
				dto.setFr_comment(rs.getString("fr_pr_comment"));
				dto.setCl_evaluate(rs.getString("cl_evaluate"));
				dto.setCl_comment(rs.getString("cl_pr_comment"));
				dto.setPr_status(rs.getInt("pr_status"));
				dto.setPr_subject(rs.getString("pr_subject"));
				dto.setFr_ids(rs.getString("fr_id_count"));
				dto.setTotal_price(rs.getString("total_price"));
//				dto.setFcheck(rs.getString("fcheck"));
				frv.add(dto);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			pool.freeConnection(con, pstmt, rs);
		}
		req.setAttribute("count1", v.size());
		req.setAttribute("count2", frv.size());		
		req.setAttribute("dtoList1", v);
		req.setAttribute("dtoList2", frv);
		System.out.println("완료후 불러오기!!");

		return "cl_pr_running_finish/cl_RF_Project_List.jsp";
	}

}
