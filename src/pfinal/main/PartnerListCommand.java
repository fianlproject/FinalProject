package pfinal.main;

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
import dto.JoinDto;
import dto.listDto;

public class PartnerListCommand implements Command {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DBConnectionMgr pool;
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		System.out.println("리스트 커맨드 통과");
		
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		String KeyWord = req.getParameter("keyWord");
		String KeyFiled = req.getParameter("keyField");
		System.out.println("파트너리스트커맨드"+KeyWord);
		System.out.println("파트너리스트커맨드"+KeyFiled);

		Vector v = new Vector();
		Vector skills = new Vector();

		String sql;
		String skillsql;
		String id = "";

		
		if(KeyWord==null||KeyWord.isEmpty()){
			 sql = "select * from members";
			 System.out.println(sql);
		}else{
			sql ="select * from members where "+KeyFiled+ " like '%"+KeyWord+"%'";
			System.out.println(sql);
			
		}
		
		try {

			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				JoinDto mdto = new JoinDto();
			
	
				mdto.setId(rs.getString("id"));
				mdto.setName(rs.getString("name"));
				mdto.setAge(rs.getInt("age"));
				mdto.setSogae(rs.getString("sogae"));
				mdto.setSkill(rs.getString("skill"));
				
				System.out.println("파트너 "+mdto.getSkill());
				v.add(mdto);
				//skills.add(list2);
			}
		
			
		} catch (Exception err) {
			System.out.println("getPartnerlist() : " + err);
			err.printStackTrace();
		}
		finally{
			pool.freeConnection(con, pstmt, rs);
		}
		

		req.setAttribute("mdtoList", v);
		
		return "pr_list/PartnerList.jsp";

	}
}
