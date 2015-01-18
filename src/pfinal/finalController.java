package pfinal;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kit.Command;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class finalController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		/*String cmd = req.getParameter("command");
		String url="";
		Command icmd = null;
		System.out.println(cmd);		
		if(cmd.equals("input")){
			icmd = new InputCommand();
		}
		else if(cmd.equals("output")){
			icmd = new OutputCommand();
		}
		else if(cmd.equals("final-sal-search")){
			icmd = new final_sal_searchCommand();
		}*/
		String realFolder = "";
		String uploadname = "";
		int maxSize = 1024*1024*5;
		String encType = "utf-8";
		String savefile = "img";
		ServletContext ctx = req.getServletContext();
		realFolder = ctx.getRealPath(savefile);
		
		
		 
		
		  String cmd=null;
		  cmd = req.getParameter("command");
		  System.out.println("222"+cmd);
	
		String url="";
		
		CommandFactory factory = CommandFactory.getInstance();
		System.out.println(factory + "¿©±â");
		Command icmd = factory.createCommand(cmd);
		url = (String)icmd.processCommand(req, resp);		
		System.out.println("icmd" + icmd);
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
	}
}
