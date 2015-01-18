package pfinal.board.Info;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

import dto.FinalDto;

public class ImgUploadCommand implements Command{
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	DBConnectionMgr pool = null;

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("00000");
		String sql = null;
		pool = DBConnectionMgr.getInstance();
		Vector v = new Vector();
		
		String realFolder = "";
		String uploadname = "";
		int maxSize = 1024*1024*5;
		String encType = "utf-8";
		String savefile = "img";		
			
		System.out.println("a");
			 
		try{			
			MultipartRequest multi1=new MultipartRequest(req, "C:\\project\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\pfinal\\img\\", maxSize, encType, new DefaultFileRenamePolicy());
			 System.out.println("b");
			 Enumeration files = multi1.getFileNames();
		     String file1 = (String)files.nextElement();
		     System.out.println(file1);
		     uploadname = multi1.getFilesystemName(file1);
			
			System.out.println(uploadname);
		     String uploadimg = realFolder + "\\" + uploadname;
		     req.setAttribute("uploadimg", uploadimg);
		     System.out.println("c");
  	        uploadname = multi1.getFilesystemName("uploadname");
			String subject = multi1.getParameter("subject");
			String content = multi1.getParameter("content");
						
			sql="insert into imgupload(subject, content, uploadname) values(?,?,?)";
			con=pool.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setString(3, uploadname);
			pstmt.executeUpdate();		
			System.out.println("d");
			sql="select * from Imgupload";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				FinalDto dto = new FinalDto();
				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setUploadname(rs.getString("uploadname"));
				System.out.println("e");
				v.add(dto);
			}
			
		
		}catch (Exception err) {			
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		req.setAttribute("vector", v);
		return "/pr_imgupload/uploadList.jsp";
	}
}
