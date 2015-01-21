package pfinal.cl_Project.RF;

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
import dto.rfDto;

public class cl_Project_Fin_View implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("완료 프로젝트 평가한거 보기");
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnectionMgr pool = null;
		;

		String pr_id = req.getParameter("pr_id");
		System.out.println(pr_id);
		String sql, fr_id;
		String[] fr_ids;
		rfDto fin_pro;
		rfDto run_fin_pro = null;
		Vector v = new Vector();
		Vector v2 = new Vector();
		int sum1 = 0;
		int sum2 = 0;
		int sum3 = 0;
		int sum4 = 0;
		int sum5 = 0;
		int s1[] = new int[5];
		int count = 0;
		int count2 = 0;
		try {

			pool = DBConnectionMgr.getInstance();
			sql = "select * from finish_project where pr_id=" + pr_id;
			System.out.println("finish_project :" + sql);
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			rs.next();
			fin_pro = new rfDto();
			fr_id = rs.getString("fr_id");
			fr_ids = fr_id.split(",");
			System.out.println(fr_ids[0]);
			req.setAttribute("pr_id", rs.getString("pr_id"));
			req.setAttribute("fr_id", fr_id);
			// 계산용
			count = Integer.parseInt(rs.getString("fr_evaluate_count"));
			// 출력용
			count2 = Integer.parseInt(rs.getString("fr_evaluate_count"));

			sql = "select fr_pr_comment, pr_subject, start_day, fin_price, fr_id,fr_evaluate, Floor((to_days(now())-to_days(start_day)))as total_day from runing_finish_project where pr_id="
					+ pr_id;

			System.out.println("runing_finish_project : " + sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
		
			if (count != 0) {
				while (rs.next()) {
					run_fin_pro = new rfDto();
					run_fin_pro.setFr_comment(rs.getString("fr_pr_comment"));
					run_fin_pro.setPr_subject(rs.getString("pr_subject"));
					run_fin_pro.setStart_day(rs.getString("start_day"));
					// run_fin_pro.setEnd_day(rs.getString("end_day"));
					run_fin_pro.setFin_price(rs.getString("fin_price"));
					run_fin_pro.setFr_id(rs.getString("fr_id"));
					run_fin_pro.setTotal_day(rs.getShort("total_day"));
					run_fin_pro.setFr_evaluate(rs.getString("fr_evaluate"));
					String eval[] = rs.getString("fr_evaluate").split(",");
					sum1 = Integer.parseInt(eval[0]);
					sum2 = Integer.parseInt(eval[1]);
					sum3 = Integer.parseInt(eval[2]);
					sum4 = Integer.parseInt(eval[3]);
					sum5 = Integer.parseInt(eval[4]);

					s1[0] += sum1;
					s1[1] += sum2;
					s1[2] += sum3;
					s1[3] += sum4;
					s1[4] += sum5;
					v2.add(run_fin_pro);

					// System.out.println("ㅊㅊ2");
				}
			}
			else{
				while (rs.next()) {
					run_fin_pro = new rfDto();
					run_fin_pro.setFr_comment(rs.getString("fr_pr_comment"));
					run_fin_pro.setPr_subject(rs.getString("pr_subject"));
					run_fin_pro.setStart_day(rs.getString("start_day"));
					// run_fin_pro.setEnd_day(rs.getString("end_day"));
					run_fin_pro.setFin_price(rs.getString("fin_price"));
					run_fin_pro.setFr_id(rs.getString("fr_id"));
					run_fin_pro.setTotal_day(rs.getShort("total_day"));
					run_fin_pro.setFr_evaluate(rs.getString("fr_evaluate"));
					
					v2.add(run_fin_pro);
					
					// System.out.println("ㅊㅊ2");
				}
			}
			// System.out.println("ㅜㅜ");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		for (int i = 0; i < s1.length; i++) {
			if(count==0){
				count= 1;
				req.setAttribute("count", count);
			}
			s1[i] = s1[i] / count;
			System.out.println(s1[i]);
			if (s1[i] == 0) {
				s1[i] = 1;
			}
		}
		String evals = s1[0] + "," + s1[1] + "," + s1[2] + "," + s1[3] + ","
				+ s1[4];
		System.out.println(evals);
		// req.setAttribute("", arg1);
		req.setAttribute("Dto1", run_fin_pro);
		req.setAttribute("dtoGetBoard", v);
		req.setAttribute("dtoGetBoard2", v2);
		// 이게 평가평균값
		req.setAttribute("evals", evals);
		
		req.setAttribute("count2", count2);
		return "cl_pr_running_finish/cl_Project_Fin_View.jsp";
	}

}
