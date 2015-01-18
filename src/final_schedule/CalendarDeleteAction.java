package final_schedule;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CalendarDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("3");
		String date = request.getParameter("date");
		
		CalDAO caldao = new CalDAO();
		int check = caldao.deleteCal(date);
		if(check==1){
			System.out.println("delete success");
		}else{
			System.out.println("delete fail");
		}
		
		
		ActionForward forward = new ActionForward(); 
		forward.setRedirect(true);
		forward.setPath("./Calendar.cl");
		return forward;
	}

}
