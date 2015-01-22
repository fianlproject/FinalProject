package pfinal.ProjectList;

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
import dto.JoinDto;
import dto.ProjectDto;
import dto.listDto;
import dto.mySchoolDto;
import dto.proDto;
import dto.quDto;

public class cl_prolist_info implements Command {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DBConnectionMgr pool;

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		

		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		
		String id = (String) req.getParameter("app_id");		
		int year=0,month=0;
		
		System.out.println("asdasd"+id);
		
		String sql = null;
		Vector vjoin = new Vector();
		Vector d_day = new Vector();
		Vector skills = new Vector();
		Vector qv = new Vector();
		Vector v = new Vector();
		String sogae="";
		try {

		pool = DBConnectionMgr.getInstance();
		con = pool.getConnection();
				
		System.out.println("이거 4");
		sql = "select name , age , tel , gender from members where id = ?";
		pstmt = con.prepareStatement(sql);			
		pstmt.setString(1, id);				
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			JoinDto join = new JoinDto();
			join.setName(rs.getString("name"));			
			join.setAge(rs.getInt("age"));
			join.setTel(rs.getString("tel"));			
			join.setGender(rs.getInt("gender"));		
			vjoin.add(join);		
		}
		System.out.println("이거 3");
		sql = "select (to_days(resign)-to_days(joins)) as day , cname , part , position from career where id = ?";			
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
				System.out.println("연" + day);
			}
			if(day>30){
				month = day/30;
				day = day - (30*month);
				list.setMonth(month);
				System.out.println("월" + day);
			}
			if(day>0){
				list.setDay(day);
				System.out.println("마지막" + day);
			}
			d_day.add(list);
		}
		System.out.println("이거 2");
		sql = "select * from skill where id = ?";			
		pstmt = con.prepareStatement(sql);			
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		while(rs.next()){
			listDto list2 = new listDto();
			list2.setSkill(rs.getString("skill"));
			list2.setExp(rs.getInt("exp"));
			list2.setMastery(rs.getInt("mastery"));
			skills.add(list2);
		}
		System.out.println("이거 1");
		sql = "select q_name,q_house,q_num,q_date from quali where id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		while(rs.next()){
			quDto qdto = new quDto();
			qdto.setQ_name(rs.getString("q_name"));
			qdto.setQ_house(rs.getString("q_house"));
			qdto.setQ_num(rs.getInt("q_num"));
			qdto.setQ_date(rs.getString("q_date"));
			qv.add(qdto);
			
			System.out.println(qdto.getQ_date()+"자격증날짜");
		}
		sql = "select * from f_projects where id=?";
		con = pool.getConnection();
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();

		while (rs.next()) {
			ProjectDto dto = new ProjectDto();
			dto.setTitle(rs.getString("title"));
			dto.setCategory(rs.getString("category"));
			dto.setCategory_sub(rs.getString("category_sub"));
			dto.setContents(rs.getString("contents"));
			dto.setStart(rs.getString("start"));
			dto.setEnd(rs.getString("end"));
			dto.setMain_image(rs.getString("main_image"));
			dto.setSub_image(rs.getString("sub_image"));
			dto.setCaption(rs.getString("caption"));
			dto.setParticipation_rate(rs.getInt("participation_rate"));
			dto.setId(rs.getString("id"));
			dto.setTag(rs.getString("tag"));
			System.out.println("e");
			v.add(dto);
			
		}
		
		//나의소개
		sql = "select sogae from members where id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		while(rs.next()){
			sogae = rs.getString("sogae");

			System.out.println("마이리스트 소개"+sogae);
		}
		
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			pool.freeConnection(con, pstmt, rs);
		}
		req.setAttribute("d_day", d_day);
		req.setAttribute("skills1", skills);
		req.setAttribute("qv", qv);
		req.setAttribute("vjoin", vjoin);
		req.setAttribute("vector", v);
		req.setAttribute("sogae", sogae);
		req.setAttribute("cl_id", id);

		String chk = "no";

		System.out.println("학교 DB체크" + id);

		Connection con;
		PreparedStatement pstmt;
		ResultSet rs;
		DBConnectionMgr pool;
		Vector schoolv = new Vector();

		String schoolsql = "select * from myschool where id='" + id + "'";

		System.out.println("학교 검색 sql " + schoolsql);
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
					schoolv.add(dto);
					System.out.println();
				}
			


		} catch (Exception err) {
			System.out.println("DB체크() : " + err);
			err.printStackTrace();
		}

		req.setAttribute("SchoolChk", chk);
		req.setAttribute("mySchoolList", schoolv);
		
		
		
		return "pr_mypage/mypage_project/cl_info.jsp";

	}
}
