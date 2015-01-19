package pfinal.fr_Project.RF;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kit.Command;
import kit.DBConnectionMgr;
import dto.rfDto;

public class fr_Evaluate_Project implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		System.out.println("프로젝트 평가 시작");

		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		String count = req.getParameter("count");
		System.out.println("\""+count+"\"");
		String pr_id = req.getParameter("pr_id");
		String pr_subject = req.getParameter("pr_subject");
		System.out.println(pr_id+","+pr_subject);
//		String []pr_id_result = pr_id.split(",");
//		for(int i=0; i<pr_id_result.length; i++){
//			System.out.println("프로젝트 평가"+pr_id+","+pr_id_result[i]);
//		}
//		pr_id = pr_id_result[0];
		
		
		
		Connection con;
		PreparedStatement pstmt;
		ResultSet rs;
		DBConnectionMgr pool;
		rfDto dto = new rfDto();

		String sql = "select pr_id, fr_id, cl_id, fin_price, start_day, end_day,"
					+ "cl_evaluate, cl_pr_comment, pr_status, pr_subject, (to_days(end_day)-to_days(start_day))as total"
					+ " From runing_finish_project where pr_id="+pr_id;
		System.out.println("여기야"+sql); 
		try {

			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, pr_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				dto.setPr_id(rs.getInt("pr_id"));
				dto.setFr_id(rs.getString("fr_id"));
				dto.setCl_id(rs.getString("cl_id"));
				dto.setFin_price(rs.getString("fin_price"));
				dto.setStart_day(rs.getString("start_day"));
				dto.setEnd_day(rs.getString("end_day"));
				dto.setTotal_day(rs.getInt("total"));
				dto.setCl_evaluate(rs.getString("cl_evaluate"));
				dto.setCl_comment(rs.getString("cl_pr_comment"));
				dto.setPr_status(rs.getInt("pr_status"));;
				dto.setPr_subject(rs.getString("pr_subject"));
			}
			
		} catch (Exception err) {
			System.out.println("getBoard() : " + err);
			err.printStackTrace();
		}
		
		req.setAttribute("dtoGetBoard", dto);
		
		return "fr_pr_running_finish/fr_Evaluate_Project.jsp";
	}

}
