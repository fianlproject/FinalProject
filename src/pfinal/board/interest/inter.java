package pfinal.board.interest;

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

public class inter implements Command {
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
		
		String inters = "";
		System.out.println(id);
		String inter[] =  req.getParameterValues("inter");
		
		for(int i = 0 ; i<inter.length;i++){
			if(i==(inter.length-1)){
				inters = inters + inter[i];
			}
			else{
				inters = inters + inter[i] +",";
			}
		}
		System.out.println("°á°ú:"+inters);
		try {

			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			sql = "update members set interest ='"+ inters +"' where id ='"+id+"'";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);			
			pstmt.executeUpdate();

			
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
