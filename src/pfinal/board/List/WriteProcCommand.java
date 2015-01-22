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

public class WriteProcCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServerException, IOException {
		listDto dto = new listDto();

		System.out.println("�۾��� proc���");

		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();

		ServletContext ctx = req.getServletContext();
		String path = ctx.getRealPath("/pr_list/upload");
		int maxSize = 50 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(req, path, maxSize,"utf-8", new DefaultFileRenamePolicy());

		String id = (String) session.getAttribute("id");
		
		System.out.println("����� : " + multi.getParameter("longitude"));
		
		String longitude = multi.getParameter("longitude");
	    String latitude = multi.getParameter("latitude");
	    System.out.println("WPC:" + longitude+", "+latitude);
		System.out.println(path);


		String user = multi.getParameter("user");
		String title = multi.getParameter("title");

		ArrayList saveFiles = new ArrayList();
		// ArrayList originFiles = new ArrayList();

		Enumeration files = multi.getFileNames();
		while (files.hasMoreElements()) {
			String name = (String) files.nextElement();
			saveFiles.add(multi.getFilesystemName(name)); // ����� ���ϸ�
		}

		String pr_skill = multi.getParameter("pr_skill");

		System.out.println("�� ���� �����" + pr_skill.trim());

		Connection con;
		PreparedStatement pstmt;
		ResultSet rs;
		DBConnectionMgr pool;
		String sql;

		dto.setPr_content(multi.getParameter("pr_content"));
		dto.setPr_subject(multi.getParameter("pr_subject"));
		dto.setPr_photo((String) saveFiles.get(0));
		dto.setPr_skill(pr_skill);
		dto.setPr_needman(Integer.parseInt(multi.getParameter("pr_needman")));
		dto.setPr_price(multi.getParameter("pr_price"));
		dto.setPr_start(multi.getParameter("pr_start"));
		dto.setPr_end(multi.getParameter("pr_end"));
		dto.setPr_private(multi.getParameter("pr_private"));
		dto.setLongitude(multi.getParameter("longitude"));
		dto.setLatitude(multi.getParameter("latitude"));
		
		


		System.out.println("�۾��� Ŀ�ǵ� ���� : " + dto.getPr_photo());

		sql = "INSERT INTO list(pr_subject, pr_content, pr_photo, pr_skill, "
				+ "pr_start, pr_end, pr_price, pr_needman,pr_private,cl_id, longitude, latitude) "
				+ "VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
		

		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getPr_subject());
			pstmt.setString(2, dto.getPr_content());
			pstmt.setString(3, dto.getPr_photo());
			pstmt.setString(4, dto.getPr_skill());
			pstmt.setString(5, dto.getPr_start());
			pstmt.setString(6, dto.getPr_end());
			pstmt.setString(7, dto.getPr_price());
			pstmt.setInt(8, dto.getPr_needman());
			pstmt.setString(9, dto.getPr_private());
			pstmt.setString(10, id);
			pstmt.setString(11, longitude);
			pstmt.setString(12, latitude);
//	����		pstmt.setString(10, dto.getFriend_id());

			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "pr_list/Pr_Ok.jsp";
	}

}
