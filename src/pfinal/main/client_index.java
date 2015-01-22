package pfinal.main;

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
import kit.Encode;
import dto.MessageDto;
import dto.ProjectDto;
import dto.proDto;
import dto.rfDto;

public class client_index implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		DBConnectionMgr pool = null;
		String sql = null;
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");

		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		ProjectDto pDto = null;
		int count = 0;
		Vector msg = new Vector();
		Vector v = new Vector();
		Vector frv = new Vector();
		Vector pro = new Vector();
		rfDto dto = null;

		boolean flag = false;
		boolean flag1 = false;
		boolean flag2 = false;

		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			
			sql = "select * from f_projects where id = ?";
			pstmt2 = con.prepareStatement(sql);
			System.out.println("id check" + id);
			pstmt2.setString(1, id);
			rs = pstmt2.executeQuery();
			while (rs.next()) {
				pDto = new ProjectDto();
				pDto.setId(rs.getString("id"));
				pDto.setTitle(rs.getString("title"));
				pDto.setCategory(rs.getString("category"));
				pDto.setCategory_sub(rs.getString("category_sub"));
				pDto.setContents(rs.getString("contents"));
				pDto.setStart(rs.getString("start"));
				pDto.setEnd(rs.getString("end"));
				pDto.setParticipation_rate(rs.getInt("participation_rate"));
				pDto.setCaption(rs.getString("caption"));
				pDto.setMain_image(rs.getString("main_image"));
				pDto.setSub_image(rs.getString("sub_image"));
				pDto.setTag(rs.getString("tag"));
				v.add(pDto);
				flag = true;
			}

			sql = "SELECT * FROM message WHERE receive_id ='" + id
					+ "' and read_status=0";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MessageDto dtos = new MessageDto();
				dtos.setRead_status(rs.getInt("read_status"));
				msg.add(dtos);
				System.out.println(msg.size());
				count = msg.size();
			}
			System.out.println(count + "login");
			// ¸Þ´ºui
			/*
			 * System.out.println("??????????????????"); sql =
			 * "SELECT menu_ui from members where id = ?";
			 * System.out.println(sql); pstmt = con.prepareStatement(sql);
			 * pstmt.setString(1, id); rs = pstmt.executeQuery(); rs.next();
			 * String menu = ""; String uis = rs.getString("menu_ui");
			 * System.out.println(uis); for (int i = 0; i < uis.length(); i++) {
			 * for(int j = 49;j<=52;j++){ if(((int)uis.charAt(i))==j){ menu =
			 * "menu" + (j-48); System.out.println("Åë°úµÊ"+menu);
			 * req.setAttribute(menu, (j-48)); } } }
			 */

			sql = "select pr_id, fr_id, cl_id, fin_price, start_day, end_day,fr_evaluate, fr_pr_comment, pr_status, pr_subject, cl_evaluate, cl_pr_comment,"
					+ "to_days(start_day)-to_days(now())as total, count(pr_id)as fr_id_count, sum(fin_price)as total_price From runing_finish_project "
					+ "WHERE cl_id ='"
					+ id
					+ "' and pr_status=0 group by pr_id order by pr_id desc ";
			System.out.println(sql);
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
				// dto.setFcheck(rs.getString("fcheck"));
				v.add(dto);
			}

			sql = "select pr_id, fr_id, cl_id, fin_price, start_day, end_day,fr_evaluate, fr_pr_comment, pr_status, pr_subject,cl_evaluate, cl_pr_comment, "
					+ "(to_days(end_day)-to_days(start_day))as total, count(pr_id)as fr_id_count, sum(fin_price)as total_price From runing_finish_project "
					+ "WHERE cl_id ='"
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
				dto.setFr_evaluate(rs.getString("fr_evaluate"));
				dto.setFr_comment(rs.getString("fr_pr_comment"));
				dto.setCl_evaluate(rs.getString("cl_evaluate"));
				dto.setCl_comment(rs.getString("cl_pr_comment"));
				dto.setPr_status(rs.getInt("pr_status"));
				dto.setPr_subject(rs.getString("pr_subject"));
				dto.setFr_ids(rs.getString("fr_id_count"));
				dto.setTotal_price(rs.getString("total_price"));
				// dto.setFcheck(rs.getString("fcheck"));
				frv.add(dto);
			}

			sql = "select pr_subject , pr_cntman from list where cl_id = '"
					+ id + "'";
			System.out.println("cl_prolist_test : " + sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			rs.next();
			String sub123 = rs.getString("pr_subject");

			sql = "select pr_subject , a.pr_id,app_id,app_con,hday,hprice,nday,nprice,check1,a.fcheck,readchk,f_del from app a , "
					+ "list l where a.pr_id = l.pr_id and a.cl_id=? and pr_subject = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, sub123);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				proDto pdto = new proDto();
				pdto.setPr_subject(rs.getString("pr_subject"));
				pdto.setPr_id(rs.getInt("pr_id"));
				pdto.setApp_id(rs.getString("app_id"));
				pdto.setApp_con(rs.getString("app_con"));
				pdto.setHday(rs.getString("hday"));
				pdto.setHprice(rs.getInt("hprice"));
				pdto.setNday(rs.getString("nday"));
				pdto.setNprice(rs.getInt("nprice"));
				pdto.setCheck(rs.getInt("check1"));
				pdto.setFcheck(rs.getInt("fcheck"));
				pdto.setReadchk(rs.getInt("readchk"));
				pdto.setF_del(rs.getInt("f_del"));
				pro.add(pdto);
			}
		} catch (Exception err) {
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		req.setAttribute("count1", v.size());
		req.setAttribute("count2", frv.size());
		req.setAttribute("dtoList1", v);
		req.setAttribute("dtoList2", frv);
		req.setAttribute("prolist", pro);
		return "client_index.jsp";
	}

}
