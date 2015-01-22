package pfinal.myschool;
import java.io.IOException;
import java.rmi.ServerException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kit.Command;

public class schoolsearch implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			 throws ServerException, IOException {
		
		
		
		return "school/school_Search.jsp";
	}

}
