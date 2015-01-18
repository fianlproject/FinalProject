package pfinal.board;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dto.FinalDao;
import dto.FinalDto;


public class upload  extends HttpServlet{

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        doPost(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
    	FinalDao dao = new FinalDao();
    	
        RequestDispatcher rd = null;
        String realFolder = "";
        String filename1 = "";
        String fileName = "";
        String fileLength = "";
        File file = null;
        String savefile = "img";
        ServletContext scontext = getServletContext();
        realFolder = scontext.getRealPath(savefile);

       String count = "";
        int maxSize = 5 * 1024 * 1024; // 최대 업로드 파일 크기 5MB(메가)로 제한

                 try {
                     MultipartRequest multi = new MultipartRequest(request,
                    		 realFolder, maxSize, "utf-8", new DefaultFileRenamePolicy());
                     count = multi.getParameter("count");
                     Enumeration efiles = multi.getFileNames();
                     int i = 0;
                     System.out.println("78");
                     while(efiles.hasMoreElements()){
                    	 FinalDto dto = new FinalDto();
                         String name = (String)efiles.nextElement(); 
                         file = multi.getFile(name);    
                         filename1 = multi.getFilesystemName(name);
                       String str = file.getName();
                       i++;
                       fileName += "&fileName"+i+"="+str;
                       fileLength += "&fileLength"+i+"="+file.length();
                       System.out.println("56");
                       String oriname = realFolder + "\\" + filename1;
                       System.out.println("real"+realFolder);
                       request.setAttribute("oriname", oriname);
                       
                       System.out.println(oriname);
                       System.out.println(multi.getFilesystemName(name));
                       
                       dto.setOriname(oriname);
                       dto.setUploadname(multi.getFilesystemName(name));
                       dao.insert(dto);
                       System.out.println("34");
                       request.setAttribute("ori1", oriname);
                       
                    }

                     }catch (Exception e) {
                        System.out.print("예외 발생 : " + e);
                    }
                 System.out.println(fileName+":fiil"+"length:"+fileLength);
         rd = getServletContext().getRequestDispatcher("/upload/uploadfileview.jsp?count="+count+fileName+fileLength);
        rd.forward(request, response);
    }
}