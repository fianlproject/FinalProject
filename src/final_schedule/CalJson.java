package final_schedule;

import org.json.simple.JSONAware;
import org.json.simple.JSONObject;

public class CalJson implements JSONAware {
	private String id;
	private String title;
	private String start;
	
	public CalJson(String id, String title, String date){
		this.id=id;
		this.title=title;
		this.start=date;
		System.out.println("json ¿È");
	}
	
	@Override
	public String toJSONString(){
	    JSONObject obj = new JSONObject();
	    obj.put("id", id);
	    obj.put("title", title);
	    obj.put("start", start);
	    return obj.toString();
	  }
}
