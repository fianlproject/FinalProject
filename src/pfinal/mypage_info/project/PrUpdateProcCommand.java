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

import kit.Command;
import kit.DBConnectionMgr;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dto.listDto;

public class PrUpdateProcCommand implements Command {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DBConnectionMgr pool;

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServerException, IOException {

		System.out.println("글수정 proc통과");

		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");

		listDto dto = new listDto();

		ServletContext ctx = req.getServletContext();
		String path = ctx.getRealPath("/pr_list/upload");
		System.out.println(path);
		int maxSize = 50 * 1024 * 1024;

		MultipartRequest multi = new MultipartRequest(req, path, maxSize,
				"euc-kr", new DefaultFileRenamePolicy());

		String user = multi.getParameter("user");
		String title = multi.getParameter("title");

		ArrayList saveFiles = new ArrayList();
		// ArrayList originFiles = new ArrayList();

		Enumeration files = multi.getFileNames();
		while (files.hasMoreElements()) {
			String name = (String) files.nextElement();
			saveFiles.add(multi.getFilesystemName(name)); // 저장될 파일명
		}

		String sql;

		// 테스트용. 잘 되면풀거임
		// dto.setC_name(multi.getParameter("c_name"));
		// dto.setPr_needman(Integer.parseInt(multi.getParameter("pr_needman")));
		// dto.setPr_content(multi.getParameter("pr_content"));
		// dto.setPr_price(multi.getParameter("pr_price"));
		// dto.setPr_skill(multi.getParameter("pr_skill"));
		// dto.setPr_subject(multi.getParameter("pr_subject"));
		// dto.setPr_photo(multi.getParameter("pr_photo"));
		// dto.setPr_exday(Integer.parseInt(multi.getParameter("pr_exday")));



		String pr_photo = multi.getParameter("uppr_photo");
		if ((String) saveFiles.get(0) != null) {
			pr_photo = (String) saveFiles.get(0);
		} else if ((String) saveFiles.get(0) == null) {
			if (multi.getParameter("uppr_photo") != null
					|| multi.getParameter("uppr_photo") != "") {
				pr_photo = multi.getParameter("uppr_photo");
			} else if (multi.getParameter("uppr_photo") == null
					|| multi.getParameter("uppr_photo") == "") {
				pr_photo = null;
			}

		}

		String deletephoto = multi.getParameter("deletephoto");

		if (deletephoto != null) {
			pr_photo = null;
		}

	
		dto.setPr_photo(pr_photo);
		dto.setPr_id(Integer.parseInt(multi.getParameter("pr_id").trim()));
		dto.setPr_content(multi.getParameter("pr_content"));
		System.out.println("글수정"+dto.getPr_content());
		dto.setPr_subject(multi.getParameter("pr_subject"));
		System.out.println("글수정"+dto.getPr_subject());

		dto.setPr_needman(Integer.parseInt(multi.getParameter("pr_needman")));
		dto.setPr_price(multi.getParameter("pr_price"));
		dto.setPr_end(multi.getParameter("pr_end"));
		dto.setPr_exday(Integer.parseInt(multi.getParameter("pr_exday")));
		dto.setPr_private(multi.getParameter("pr_private"));

		sql = "update list set pr_subject = ? , pr_content = ?,  pr_photo = ?, pr_needman=?, pr_price=?,pr_end=?,pr_exday=?,pr_private=? "
				+ "where pr_id=?";

		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			// 테스트용. 잘 되면풀거임

			// pstmt.setString(1, dto.getC_name());
			// pstmt.setInt(2, dto.getPr_needman());
			// pstmt.setString(3, dto.getPr_content());
			// pstmt.setString(4, dto.getPr_price());
			// pstmt.setString(5, dto.getPr_skill());
			// pstmt.setString(6, dto.getPr_subject());
			// pstmt.setString(7, dto.getPr_photo());
			// pstmt.setInt(8, dto.getPr_exday());

			pstmt.setString(1, dto.getPr_subject());
			pstmt.setString(2, dto.getPr_content());
			pstmt.setString(3, dto.getPr_photo());
			pstmt.setInt(4, dto.getPr_needman());
			pstmt.setString(5, dto.getPr_price());
			pstmt.setString(6, dto.getPr_end());
			pstmt.setInt(7, dto.getPr_exday());
			pstmt.setString(8, dto.getPr_private());
			pstmt.setInt(9, dto.getPr_id());

			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return "pr_list/Pr_Ok.jsp";
	}

}
