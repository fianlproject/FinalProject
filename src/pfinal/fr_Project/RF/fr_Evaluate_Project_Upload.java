package pfinal.fr_Project.RF;

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

public class fr_Evaluate_Project_Upload implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("평가 업로드 시작");

		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnectionMgr pool = null;
		String sql = null;
		Vector v = new Vector();
		Vector frv = new Vector();
		rfDto dto = null;
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		String pr_id = req.getParameter("pr_id");
		String eval = req.getParameter("pr_evaluate1") + ","
				+ req.getParameter("pr_evaluate2") + ","
				+ req.getParameter("pr_evaluate3") + ","
				+ req.getParameter("pr_evaluate4") + ","
				+ req.getParameter("pr_evaluate5");

		String comment = req.getParameter("comment");
		boolean flag = false;
		try {
			pool = DBConnectionMgr.getInstance();

//			sql = "select fr_evaluate_count from runing_finish_project where pr_id="	+ pr_id+"' and fr_id='"+id+"'";
//			System.out.println("더할값 불러오기 : "+sql);
//			con = pool.getConnection();
//			pstmt = con.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			rs.next();
//			if(rs.getInt("fr_evaluate_count")!=0){
//				flag = true;
//			}
			
//			if (flag==false){
				sql = "update runing_finish_project set fr_evaluate='"+eval+"', fr_pr_comment='"+comment+"', fr_evaluate_count=fr_evaluate_count+1 where pr_id="+pr_id+" and fr_id='"+id+"'";
				System.out.println(sql);
				System.out.println("인서트 통과");
//			}
//			else if(flag==true) {
////				String evals = rs.getString("fr_evaluate");
////				String a[] = evals.split(",");
////				String b[] = evals.split(",");
////				int sum[]=null;
////				for(int i = 0 ; i < a.length ; i++){
////					sum[i] = Integer.parseInt(a[i])+Integer.parseInt(b[i]);
////					System.out.println(sum[i]);
////				}
//				sql = "update runing_finish_project set fr_evaluate='" + eval
//						+ "', fr_pr_comment=fr_pr_comment+'" + comment + "' WHERE pr_id="
//						+ pr_id;
//				System.out.println(sql);
//				System.out.println("업데이트 통과");
//			}
				con = pool.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.executeUpdate();
			
			sql = "select pr_id, fr_id, cl_id, fin_price, start_day, end_day, cl_evaluate,cl_pr_comment, pr_status, pr_subject, fr_evaluate, fr_pr_comment,"
					+ "(to_days(end_day)-to_days(start_day))as total, count(pr_id)as fr_id_count, sum(fin_price)as total_price From runing_finish_project "
					+ "WHERE fr_id ='"
					+ id
					+ "' and pr_status=0 group by pr_id order by pr_id desc ";

			System.out.println("다시 불러오기: " + sql);
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
				dto.setCl_evaluate(rs.getString("cl_evaluate"));
				dto.setCl_comment(rs.getString("cl_pr_comment"));
				dto.setFr_evaluate(rs.getString("fr_evaluate"));
				dto.setFr_comment(rs.getString("fr_pr_comment"));
				dto.setPr_status(rs.getInt("pr_status"));
				;
				dto.setPr_subject(rs.getString("pr_subject"));
				dto.setFr_ids(rs.getString("fr_id_count"));
				dto.setTotal_price(rs.getString("total_price"));

				v.add(dto);
			}
			sql = "select pr_id, fr_id, cl_id, fin_price, start_day, end_day, fr_evaluate, fr_pr_comment, pr_status, pr_subject,  cl_evaluate, cl_pr_comment,"
					+ "(to_days(end_day)-to_days(start_day))as total, count(pr_id)as fr_id_count, sum(fin_price)as total_price From runing_finish_project "
					+ "WHERE fr_id ='"
					+ id
					+ "' and pr_status=1 group by pr_id order by pr_id desc ";
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
				dto.setCl_evaluate(rs.getString("cl_evaluate"));
				dto.setCl_comment(rs.getString("cl_pr_comment"));
				dto.setFr_evaluate(rs.getString("fr_evaluate"));
				dto.setFr_comment(rs.getString("fr_pr_comment"));
				dto.setPr_status(rs.getInt("pr_status"));
				dto.setPr_subject(rs.getString("pr_subject"));
				dto.setFr_ids(rs.getString("fr_id_count"));
				dto.setTotal_price(rs.getString("total_price"));
				frv.add(dto);
			}

		} catch (Exception err) {
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		System.out.println("업로드 완료");
		req.setAttribute("count1", v.size());
		req.setAttribute("count2", frv.size());
		req.setAttribute("dtoList1", v);
		req.setAttribute("dtoList2", frv);
		return "fr_pr_running_finish/fr_RF_Project_List.jsp";
	}

}
