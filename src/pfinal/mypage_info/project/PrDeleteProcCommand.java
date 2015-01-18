package pfinal.mypage_info.project;

import java.io.IOException;
import java.rmi.ServerException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kit.Command;
import kit.DBConnectionMgr;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dto.listDto;

public class PrDeleteProcCommand implements Command {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DBConnectionMgr pool;

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServerException, IOException {

		System.out.println("프로젝트 삭제 통과");

		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		
		String pr_id = req.getParameter("pr_id");
		System.out.println("프로젝트 삭제 프로젝트 아이디"+pr_id);
		
		Connection con;
		PreparedStatement pstmt;
		ResultSet rs;
		DBConnectionMgr pool;
		String sql;
		
		sql = "delete from list where pr_id=" + pr_id;
		System.out.println("삭제 sql : " + sql);

		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);

			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
	
		return "pr_list/Pr_Ok.jsp";
	}

}
