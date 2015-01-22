package final_schedule;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kit.DBConnectionMgr;


public class CalDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private DBConnectionMgr pool;
	private ResultSet rs;
	
	public CalDAO(){
		System.out.println("4");
		try{
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("getConnection(): " + err);
		}
	}
	
	
	public int insertCal(CalBean calbean){
		String sql="";
		System.out.println("캘린더2");
		int check=0;
		
		try{
			
			con=pool.getConnection();
			sql="insert into diary(id,title,date) values(?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, calbean.getId());
			pstmt.setString(2, calbean.getTitle());
			pstmt.setString(3, calbean.getDate());
			pstmt.executeUpdate();
			check=1;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			pool.freeConnection(con, pstmt, rs);
		}
		
		return check;
	}
	
	public List<CalBean> getCal8(){
		List<CalBean> calList = new ArrayList<CalBean>();
		String sql = "";
		System.out.println("스케줄1");
		try{
			con=pool.getConnection();
			sql="select * from diary" ;
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				CalBean calbean = new CalBean();
				calbean.setId(rs.getString("id"));
				calbean.setTitle(rs.getString("title"));
				calbean.setDate(rs.getString("date"));				
				calList.add(calbean);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return calList;
	}	

	public int deleteCal(String date) {
		int check=0;

		String sql = "";
		System.out.println(date);
		try{
			con=pool.getConnection();
			sql="select * from diary where date=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, date);
			rs=pstmt.executeQuery();
			if(rs.next()){
				sql="delete from diary where date=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, date);
				pstmt.executeUpdate();
				
				check=1;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return check;
	}

}
