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

public class Pr_SkillInsert implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServerException, IOException {
		listDto dto = new listDto();

		System.out.println("글쓰기 proc통과");

		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();

		String id = (String) session.getAttribute("id");
		
		String pr_skill = "";
		String[] pr_skills = req.getParameterValues("inter");

		for (int i = 0; i < pr_skills.length; i++) {
			pr_skill += pr_skills[i];
			if (i < pr_skills.length - 1) {
				pr_skill += ',';
			}
		}
		
		System.out.println("걍 변수 기술들" + pr_skill.trim());


		req.setAttribute("pr_skill", pr_skill);

		return "pr_list/Pr_Write.jsp";
	}

}
