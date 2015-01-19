package pfinal.main;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;

import kit.Command;
import kit.DBConnectionMgr;
 
public class Rss_ChkCommand implements Command {
	DBConnectionMgr pool = null;
	ResultSet rs = null;
	Connection conn = null;                                        
	PreparedStatement pstmt = null;
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		return null;
	}
		
	public String RssSearch(String userid){
		
		
		System.out.println("searchId : "+userid.trim());
		String rss="";
		
		try{
			pool = DBConnectionMgr.getInstance();
			conn = pool.getConnection();
			
			String sql = "select media_rss from media where media_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			
			
			if(rs.next()){
				rss = rs.getString("media_rss");
			}
			
			

		}
		catch(Exception err){
			System.out.println("searchId() : "+err );
			err.printStackTrace();
		}
		finally{
			pool.freeConnection(conn, pstmt, rs);
		}
		
		return rss;
	}

}
