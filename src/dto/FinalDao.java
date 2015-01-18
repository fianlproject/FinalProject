package dto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import kit.DBConnectionMgr;

public class FinalDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet	rs;
	private DBConnectionMgr pool;
	
	public FinalDao(){
		try{
			pool = DBConnectionMgr.getInstance();
		}catch(Exception err){
			System.out.println("BoardDao() :" +err);
		}
	}
	
	public Vector getList(){
		Vector v = new Vector();
		String sql;
		
		try{
			
			sql="select * from Imgupload";
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				FinalDto dto = new FinalDto();
				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setUploadname(rs.getString("uploadname"));
				dto.setOriname(rs.getString("oriname"));
				v.add(dto);
			}
		}
		catch(Exception err){
			System.out.println("getList() :" +err);
			err.printStackTrace();
		}
		finally{
			pool.freeConnection(con,pstmt,rs);
		}
		return v;
	}
	
	public void insert(FinalDto dto){
		String sql =null;
		try{
			sql="insert into imgupload(subject, content, uploadname, oriname) values(?,?,?,?)";
			con=pool.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getUploadname());
			pstmt.setString(4, dto.getOriname());
			pstmt.executeUpdate();	
		}
		catch(Exception err){
			System.out.println("insert() :" +err);
			err.printStackTrace();
		}
		finally{
			pool.freeConnection(con,pstmt);
		}
	}

}
