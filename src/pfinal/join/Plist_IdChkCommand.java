package pfinal.join;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kit.Command;
import kit.DBConnectionMgr;
 
public class Plist_IdChkCommand implements Command {
	DBConnectionMgr pool = null;
	ResultSet rs = null;
	Connection conn = null;                                        
	PreparedStatement pstmt = null;
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		return null;
	}
		
	public boolean searchId(String userid){
		
		System.out.println("searchId : "+userid.trim());
		boolean idchk=false;
		
		
		try{
			pool = DBConnectionMgr.getInstance();
			conn = pool.getConnection();
			
			String sql = "SELECT id FROM members WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				idchk = true;
			}
			System.out.println(idchk);

		}
		catch(Exception err){
			System.out.println("searchId() : "+err );
		}
		finally{
			pool.freeConnection(conn, pstmt, rs);
		}
		return idchk;
	}

}
