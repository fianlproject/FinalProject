package pfinal.mypage_info;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.ProjectDto;
import dto.listDto;
import dto.mySchoolDto;
import dto.quDto;
import kit.Command;
import kit.DBConnectionMgr;


public class quali implements Command {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DBConnectionMgr pool;
	int year=0,month=0;
	Vector d_day = new Vector();
	Vector skills = new Vector();
	Vector qv = new Vector();
	Vector pv = new Vector();
	String sogae = null;
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		String sql = null;
		
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		
		String q_name = req.getParameter("q_name");
		String q_house = req.getParameter("q_house");
		int q_num = Integer.parseInt(req.getParameter("q_num"));
		String q_date = req.getParameter("q_date");
		
		try{
			
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			
			sql = "select code from members where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();
			int code = rs.getInt("code");
			
			sql = "insert into quali(code, q_name, q_house, q_num, q_date, id) values(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, code);
			pstmt.setString(2, q_name);
			pstmt.setString(3, q_house);
			pstmt.setInt(4, q_num);
			pstmt.setString(5, q_date);
			pstmt.setString(6, id);
			pstmt.executeUpdate();
			System.out.println(sql+"�ڰ���");
			
			sql = "select (to_days(resign)-to_days(joins)) as day , cname , part , position , joins , resign , career_index from career where id = ?";			
			pstmt = con.prepareStatement(sql);			
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				listDto list = new listDto();
				list.setCname(rs.getString("cname"));
				list.setPart(rs.getString("part"));
				list.setPosition(rs.getString("position"));
				int day = rs.getInt("day");
				if(day>365){
					year = day/365;
					day = day - (365*year);
					list.setYear(year);
					System.out.println("��" + day);
				}
				if(day>30){
					month = day/30;
					day = day - (30*month);
					list.setMonth(month);
					System.out.println("��" + day);
				}
				if(day>0){
					list.setDay(day);
					System.out.println("������" + day);
				}
				list.setJoin(rs.getString("joins"));
				list.setResign(rs.getString("resign"));
				list.setCareer_index(rs.getString("career_index"));
				d_day.add(list);
			} 
			
			sql = "select * from skill where id = ?";			
			pstmt = con.prepareStatement(sql);			
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				listDto list2 = new listDto();
				list2.setSkill(rs.getString("skill"));
				list2.setExp(rs.getInt("exp"));
				list2.setMastery(rs.getInt("mastery"));
				list2.setSkill_index(rs.getString("skill_index"));
				skills.add(list2);
			}
			
			sql = "select * from f_projects where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProjectDto pdto = new ProjectDto();
				pdto = new ProjectDto();
				pdto.setTitle(rs.getString("title"));
				pdto.setCategory(rs.getString("category"));
				pdto.setCategory_sub(rs.getString("category_sub"));
				pdto.setContents(rs.getString("contents"));
				pdto.setStart(rs.getString("start"));
				pdto.setEnd(rs.getString("end"));
				pdto.setMain_image(rs.getString("main_image"));
				pdto.setSub_image(rs.getString("sub_image"));
				pdto.setCaption(rs.getString("caption"));
				pdto.setParticipation_rate(rs.getInt("participation_rate"));
				pdto.setId(rs.getString("id"));
				pdto.setTag(rs.getString("tag"));
				System.out.println("project");
				pv.add(pdto);
			
			}
			
			sql = "select * from quali where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				quDto qdto = new quDto();
				qdto.setQ_name(rs.getString("q_name"));
				qdto.setQ_house(rs.getString("q_house"));
				qdto.setQ_num(rs.getInt("q_num"));
				qdto.setQ_date(rs.getString("q_date"));
				qdto.setQuali_index(rs.getString("quali_index"));
				qv.add(qdto);
				
				System.out.println(qdto.getQ_date()+"�ڰ�����¥");
			}
			
			sql = "select sogae from members where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				sogae = rs.getString("sogae");
	
				System.out.println("���̸���Ʈ �Ұ�"+sogae);
			}
						
		} catch (Exception err) {
			System.out.println("getBoard() : " + err);
			err.printStackTrace();
		}
		finally{
			pool.freeConnection(con, pstmt, rs);
		}
		req.setAttribute("d_day", d_day);
		req.setAttribute("skills1", skills);
		req.setAttribute("qv", qv);
		req.setAttribute("sogae", sogae);
		req.setAttribute("vector", pv);
		
		
		
		
		String chk = "no";

		System.out.println("�б� DBüũ" + id);

		Connection con;
		PreparedStatement pstmt;
		ResultSet rs;
		DBConnectionMgr pool;
		Vector v = new Vector();

		String schoolsql = "select * from myschool where id='" + id + "'";

		System.out.println("�б� �˻� sql " + schoolsql);
		try {

			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(schoolsql);
			rs = pstmt.executeQuery();

			
				
				while (rs.next()) {
					chk = "yes";
					mySchoolDto dto = new mySchoolDto();
					dto.setSchoolname(rs.getString("school_name"));
					dto.setSchoolmajor(rs.getString("school_major"));
					dto.setSchoolstate(rs.getString("school_state"));
					dto.setSchoolid(rs.getInt("school_id"));
					
					v.add(dto);
					System.out.println();
				}
			


		} catch (Exception err) {
			System.out.println("DBüũ() : " + err);
			err.printStackTrace();
		}

		req.setAttribute("SchoolChk", chk);
		req.setAttribute("mySchoolList", v);
		return "pr_mypage/mylist.jsp";

	}
}