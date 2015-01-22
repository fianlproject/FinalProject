package pfinal.board.List;

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

public class prskillupdate implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServerException, IOException {
		listDto dto = new listDto();

		System.out.println("prskillupdateÅë°ú");

		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		String pr_id = req.getParameter("pr_id");
		String pr_nowskill = req.getParameter("pr_nowskill");
		
		req.setAttribute("pr_nowskill", pr_nowskill);
		req.setAttribute("pr_id", pr_id);
		
		

		return "pr_list/Pr_skillupdatechoice.jsp";
	}

}
