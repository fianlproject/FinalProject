package dto;

public class rfDto {
	private int pr_id, total_day, pr_status,fcheck;
	private String fr_id, cl_id, fin_price, start_day, end_day, cl_comment, pr_subject, cl_evaluate;
	private String fr_ids, total_price,category, fr_comment, fr_evaluate;;
	private String[] fr;
	
	public String getCl_comment() {
		return cl_comment;
	}
	public void setCl_comment(String cl_comment) {
		this.cl_comment = cl_comment;
	}
	public String getCl_evaluate() {
		return cl_evaluate;
	}
	public void setCl_evaluate(String cl_evaluate) {
		this.cl_evaluate = cl_evaluate;
	}
	public String getFr_comment() {
		return fr_comment;
	}
	public void setFr_comment(String fr_comment) {
		this.fr_comment = fr_comment;
	}
	public String getFr_evaluate() {
		return fr_evaluate;
	}
	public void setFr_evaluate(String fr_evaluate) {
		this.fr_evaluate = fr_evaluate;
	}
	public int getFcheck() {
		return fcheck;
	}
	public void setFcheck(int fcheck) {
		this.fcheck = fcheck;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String[] getFr() {
		return fr;
	}
	public void setFr(String[] fr) {
		this.fr = fr;
	}
	public int getPr_id() {
		return pr_id;
	}
	public void setPr_id(int pr_id) {
		this.pr_id = pr_id;
	}
	public int getTotal_day() {
		return total_day;
	}
	public void setTotal_day(int total_day) {
		this.total_day = total_day;
	}
	public int getPr_status() {
		return pr_status;
	}
	public void setPr_status(int pr_status) {
		this.pr_status = pr_status;
	}
	public String getFr_id() {
		return fr_id;
	}
	public void setFr_id(String fr_id) {
		this.fr_id = fr_id;
	}
	public String getCl_id() {
		return cl_id;
	}
	public void setCl_id(String cl_id) {
		this.cl_id = cl_id;
	}
	public String getFin_price() {
		return fin_price;
	}
	public void setFin_price(String fin_price) {
		this.fin_price = fin_price;
	}
	public String getStart_day() {
		return start_day;
	}
	public void setStart_day(String start_day) {
		this.start_day = start_day;
	}
	public String getEnd_day() {
		return end_day;
	}
	public void setEnd_day(String end_day) {
		this.end_day = end_day;
	}
	public String getPr_subject() {
		return pr_subject;
	}
	public void setPr_subject(String pr_subject) {
		this.pr_subject = pr_subject;
	}
	public String getFr_ids() {
		return fr_ids;
	}
	public void setFr_ids(String fr_ids) {
		this.fr_ids = fr_ids;
	}
	public String getTotal_price() {
		return total_price;
	}
	public void setTotal_price(String total_price) {
		this.total_price = total_price;
	}
	
}
