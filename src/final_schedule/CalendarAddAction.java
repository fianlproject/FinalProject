package final_schedule;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class CalendarAddAction implements Action {

	@Override
	public final_schedule.ActionForward execute(
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		System.out.println("4");
		CalBean calbean = new CalBean();
		calbean.setId(request.getParameter("id"));
		calbean.setTitle(request.getParameter("title"));
		calbean.setDate(request.getParameter("date"));		
		System.out.println(request.getParameter("id"));
		CalDAO caldao = new CalDAO();
		int check = caldao.insertCal(calbean);
		if(check==1){
			System.out.println("insert success");
		}else{
			System.out.println("insert fail");
		}
		
		ActionForward forward = new ActionForward(); 
		forward.setRedirect(true);
		forward.setPath("./Calendar.cl");
		return forward;
	}

	
}
