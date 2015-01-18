package pfinal.mypage_info.project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;





import kit.Command;
import kit.DBConnectionMgr;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dto.ProjectDto;

public class ProjectCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		System.out.println("00000");
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		DBConnectionMgr pool = null;
		String sql = null;
		Vector v = new Vector();

		ServletContext ctx = req.getServletContext();
		String path = ctx.getRealPath("/upload");
		System.out.println(path);
		int maxSize = 50 * 1024 * 1024;

		System.out.println("a");
		MultipartRequest multi = new MultipartRequest(req, path, maxSize,
				"utf-8", new DefaultFileRenamePolicy());
		System.out.println("b");
		ArrayList saveFiles = new ArrayList();
		// ArrayList originFiles = new ArrayList();

		Enumeration files = multi.getFileNames();
		int zoom = 5;
		System.out.println(files);
		while (files.hasMoreElements()) {
			String name = (String) files.nextElement();
			saveFiles.add(multi.getFilesystemName(name)); // 저장될 파일명
			System.out.println(saveFiles);
//			for(int i=0; i < saveFiles.size(); i++){
//			String orgFileName = path+"\\"+saveFiles.get(i); //경로+ 원본 이미지 파일명
//			String thumbFileName = path+"\\small"+saveFiles.get(i);
//			Thumbnail.createImage(orgFileName, thumbFileName, zoom);
//			}
		}
		System.out.println("c");
		String id = multi.getParameter("id");
		System.out.println("id" + id);
		String title = multi.getParameter("title");
		String category = multi.getParameter("categoryId");
		String category_sub = multi.getParameter("subcategoryId");
		System.out.println(category + "," + category_sub);
		String contents = multi.getParameter("description");
		String start_year = multi.getParameter("participationBeginYear");
		String start_month = multi.getParameter("participationBeginMonth");
		String start = start_year + "/" + start_month;
		String end_year = multi.getParameter("participationEndYear");
		String end_month = multi.getParameter("participationEndMonth");
		String end = end_year + "/" + end_month;
		System.out.println("date" + start + "," + end);
		String participation_rate = multi.getParameter("participationRate");
		System.out.println(participation_rate);
		String main_image = (String) saveFiles.get(0);
		String sub_image = (String) saveFiles.get(1) + ","
				+ (String) saveFiles.get(2);
		// String main_image = multi.getParameter("image1");
		// String sub_image1 = multi.getParameter("image2");
		// String sub_image2 = multi.getParameter("image3");
		// String sub_image = sub_image1 + "," + sub_image2;
		System.out.println("image:" + main_image + ", " + sub_image);
		String caption1 = multi.getParameter("caption1");
		String caption2 = multi.getParameter("caption2");
		String caption3 = multi.getParameter("caption3");
		String caption = caption1 + "," + caption2 + "," + caption3;
		System.out.println(caption);
		String tag = multi.getParameter("tagList");
		System.out.println("tag" + tag);
		ProjectDto dto = null;
		boolean flag = false;
		try {
			pool = DBConnectionMgr.getInstance();
			//
			sql = "insert into f_projects (id, title, category, category_sub, contents, start, end, participation_rate, main_image, sub_image,caption, tag)"
					+ "Values(?,?,?,?,?,?,?,?,?,?,?,?)";
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, title);
			pstmt.setInt(3, Integer.parseInt(category));
			pstmt.setInt(4, Integer.parseInt(category_sub));
			pstmt.setString(5, contents);
			pstmt.setString(6, start);
			pstmt.setString(7, end);
			pstmt.setInt(8, Integer.parseInt(participation_rate));
			pstmt.setString(9, main_image);
			pstmt.setString(10, sub_image);
			pstmt.setString(11, caption);
			pstmt.setString(12, tag);
			pstmt.executeUpdate();
			System.out.println("d");

//			sql = "select * from f_projects where id=?";
//			pstmt2 = con.prepareStatement(sql);
//			pstmt2.setString(1, id);
//			rs = pstmt2.executeQuery();
//
//			while (rs.next()) {
//				dto = new ProjectDto();
//				dto.setTitle(rs.getString("title"));
//				dto.setCategory(rs.getString("category"));
//				dto.setCategory_sub(rs.getString("category_sub"));
//				dto.setContents(rs.getString("contents"));
//				dto.setStart(rs.getString("start"));
//				dto.setEnd(rs.getString("end"));
//				dto.setMain_image(rs.getString("main_image"));
//				dto.setSub_image(rs.getString("sub_image"));
//				dto.setCaption(rs.getString("caption"));
//				dto.setParticipation_rate(rs.getInt("participation_rate"));
//				dto.setId(rs.getString("id"));
//				dto.setTag(rs.getString("tag"));
//				System.out.println("e");
//				v.add(dto);
//				flag = true;
//			}

		} catch (Exception err) {
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
//		req.setAttribute("vector", v);
//		req.setAttribute("flag", flag);
		return "pr_mypage/mypage.jsp";
	}

}
