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

import kit.Command;
import kit.DBConnectionMgr;
import dto.listDto;

public class menu_ui implements Command {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DBConnectionMgr pool;

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		String sql = null;
		
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		
		String uis = "";
		System.out.println(id);
		String ui[] =  req.getParameterValues("ui");
		for(int i = 0 ; i<ui.length;i++){
			if(i==(ui.length-1)){
				uis = uis + ui[i];
			}
			else{
				uis = uis + ui[i];
			}
		}
		System.out.println(uis);
		for (int i = 0; i < uis.length(); i++) {
		      System.out.println( uis.charAt(i) );
		}
		
		try {

			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			sql = "update members set menu_ui ='"+ uis +"' where id ='"+id+"'";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);			
			pstmt.executeUpdate();
			
			System.out.println("??????????????????");
			sql = "SELECT menu_ui from members where id = ?";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();
			String menu = "";
			String uis1 = rs.getString("menu_ui"); 
			System.out.println(uis1);
			for (int i = 0; i < uis1.length(); i++) {
				for(int j = 49;j<=52;j++){
					if(((int)uis1.charAt(i))==j){
						menu = "menu" + (j-48);
				    	System.out.println("Ελ°ϊµΚ"+menu);
				    	req.setAttribute(menu, (j-48));
					}
				}
			}
			
		} catch (Exception err) {
			System.out.println("getBoard() : " + err);
			err.printStackTrace();
		}
		finally{
			pool.freeConnection(con, pstmt, rs);
		}
	
		return "free_index.jsp";

	}
}
