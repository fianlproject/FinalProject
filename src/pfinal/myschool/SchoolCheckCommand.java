package pfinal.myschool;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.CORBA.Request;

import kit.Command;
import kit.DBConnectionMgr;
import dto.schoolDto;

public class SchoolCheckCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		return null;
	}

	public boolean searchId(String schoolname){
		
		
		Connection con;
		PreparedStatement pstmt;
		ResultSet rs;
		DBConnectionMgr pool;
		boolean idchk = false;
		
		

		String sql = "select number, address, name, type from school where name like '%"
				+ schoolname + "%' ";

		System.out.println("학교 검색 sql " + sql);
	

		
		try {

			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				idchk = true;

			}
		} catch (Exception err) {
			System.out.println("getBoard() : " + err);
			err.printStackTrace();
		}

		System.out.println(idchk);
		return idchk;

	}
}
