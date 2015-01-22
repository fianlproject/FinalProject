package pfinal.main.login;

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
import dto.rfDto;

public class loginTest implements Command {
	Connection con = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;
	ResultSet rs = null;
	DBConnectionMgr pool = null;
	String sql = null;

	String pw1;
	String id1;
	String name;
	int cpcheck = 2;
	String media;
	String rss;
	Vector v = new Vector();

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");

		HttpSession session = req.getSession();

		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		pw = Encode.encrypt(pw);
		ProjectDto pDto = null;
		boolean flag = false;
		Vector msg = new Vector();
		int count = 0;
		Vector v = new Vector();
		Vector frv = new Vector();
		rfDto dto = null;
		// rfDto frdto = null;

		boolean flag1 = false;
		boolean flag2 = false;
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();

			sql = "select id,pw,cpcheck,name,media from members where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();

			id1 = rs.getString("id");
			pw1 = rs.getString("pw");
			cpcheck = rs.getInt("cpcheck");
			name = rs.getString("name");
			media = rs.getString("media");

			sql = "select media_rss,media_name from media where media_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, media);
			rs = pstmt.executeQuery();
			rs.next();
			rss = rs.getString("media_rss");
			String media_name = rs.getString("media_name");
			session.setAttribute("rss", rss);
			session.setAttribute("media_name", media_name);

			session.setAttribute("name", name);
			session.setAttribute("id", id1);
			session.setAttribute("cpcheck", cpcheck);

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
			// 메뉴ui
			/*
			 * System.out.println("??????????????????"); sql =
			 * "SELECT menu_ui from members where id = ?";
			 * System.out.println(sql); pstmt = con.prepareStatement(sql);
			 * pstmt.setString(1, id); rs = pstmt.executeQuery(); rs.next();
			 * String menu = ""; String uis = rs.getString("menu_ui");
			 * System.out.println(uis); for (int i = 0; i < uis.length(); i++) {
			 * for(int j = 49;j<=52;j++){ if(((int)uis.charAt(i))==j){ menu =
			 * "menu" + (j-48); System.out.println("통과됨"+menu);
			 * req.setAttribute(menu, (j-48)); } } }
			 */

			sql = "select pr_id, fr_id, cl_id, fin_price, start_day, end_day,fr_evaluate, fr_pr_comment, pr_status, pr_subject, cl_evaluate, cl_pr_comment,"
					+ "(to_days(end_day)-to_days(start_day))as total, count(pr_id)as fr_id_count, sum(fin_price)as total_price From runing_finish_project "
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

		} catch (Exception err) {
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		if ((cpcheck == 0 && pw1.equals(pw))) {
			System.out.println("통과");
			req.setAttribute("flag", flag);
			req.setAttribute("vector", v);
			req.setAttribute("msg", count);
			return "free_index.jsp";
		} else if ((cpcheck == 1 && pw1.equals(pw))) {
			return "client_index.jsp";
		} else {
			return "reindex.jsp";
		}
	}
}
