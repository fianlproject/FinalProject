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

public class myschoolupdatesearch implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		
		String schoolid = req.getParameter("schoolid");
		
		return "school/school_UpdateSearch.jsp";
	
	
	
	}

}
