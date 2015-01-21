
<?xml version="1.0" encoding="EUC-KR" ?>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DecimalFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
	<title>�����ϱ�</title>
	<link href="css/7911bc0a5c62.css" rel="stylesheet">
		<link href="css/7e63fa136b7d.css" rel="stylesheet">
			<link href="css/facebook.css" rel="stylesheet">
				<link href="css/floating.css" rel="stylesheet">
					<link href="css/layout_nav.css" rel="stylesheet">
						<link href="css/map.css" rel="stylesheet">

							<style type="text/css">
#sm-group {
	width: 30%;
}
</style>

							<script>
								$(function() {
									$("#datepicker").datepicker({
										changeMonth : true,
										changeYear : true,
										showButtonPanel : true,
										dateFormat : "yy/mm/dd"
									});
								});
							</script>
</head>
<%
	DecimalFormat df = new DecimalFormat("00");
	Calendar currentCalendar = Calendar.getInstance();

	//���� ��¥ ���ϱ�
	String strYear = Integer.toString(currentCalendar
			.get(Calendar.YEAR));
	String strMonth = df
			.format(currentCalendar.get(Calendar.MONTH) + 1);
	String strDay = df.format(currentCalendar.get(Calendar.DATE));
	String pr_start = strYear + "." + strMonth + "." + strDay;
%>


<br />
<body class="project-list">
	${pr_nowskill }
	<div id="wrap1">
		<div class="page">
			<div class="content">
				<div class="content-header">
					<h3 class="header-text">������Ʈ ����</h3>
				</div>

				<div class="content-header">
					<div class="content-inner">

						<form enctype="multipart/form-data" name="pr_write" method="post"
							action="/pfinal/pfinal.do?command=prupdateProc">
							<input type="hidden" id="longitude" name="longitude"> <input
								type="hidden" id="latitude" name="latitude"> <input
									type="hidden" name="pr_id" value="${pr_id }"> <input
										type="hidden" name="uppr_photo" value="${pr_photo }">
											<input type="hidden" name="pr_nowskill"
											value="${pr_nowskill }">




												<div class="form-group ">
													<label class="control-label required" for="title"><span>*</span>������Ʈ
														����</label>

													<div class="control-wrapper">
														<input class="form-control" id="pr_subject"
															name="pr_subject" maxlength="30" size="30" type="text"
															value="${pr_subject }"><span class="help-block"></span>
													</div>
												</div> <input type="hidden" name="pr_start" id="pr_start"
												value=<%=pr_start%> size="8"> <%
 	request.setAttribute("pr_start", pr_start);
 %>



													<div class="form-group project-term-form-group ">
														<label class="control-label required" for="project_term"><span>*</span>���ᳯ¥</label>
														<div id="sm-group">
															<div class="input-group">
																<input autocomplete="off" class="form-control"
																	id="datepicker" name="pr_end" required="required"
																	type="text" value="${pr_end }"><span
																	class="input-group-addon">��</span>
															</div>
															<span class="help-block">������ ��¥ ${pr_end }</span>
														</div>
													</div>

													<div class="form-group project-term-form-group ">
														<label class="control-label required" for="project_term"><span>*</span>����¥</label>
														<div id="sm-group">
															<div class="input-group">
																<input autocomplete="off" class="form-control"
																	id="pr_exday" name="pr_exday" required="required"
																	type="text" value="${pr_exday }"><span
																	class="input-group-addon">��</span>
															</div>

														</div>
													</div>

													<div class="form-group project-budget-form-group ">
														<label class="control-label required" for="budget_maximum"><span>*</span>����
															���� ����</label>
														<div id="sm-group">
															<div class="input-group">
																<span class="input-group-addon">��</span><input
																	class="form-control" id="pr_price" name="pr_price"
																	required="required" type="text" value="${pr_price }">
															</div>
															<span class="help-block">���� ������ ������ �Է��� �ּ���. (��
																100,000,000)</span>
														</div>
													</div>

													<div class="form-group project-budget-form-group ">
														<label class="control-label required" for="budget_maximum"><span>*</span>�ʿ�
															�ο� ��</label>
														<div id="sm-group">
															<div class="input-group">
																<input autocomplete="off" class="form-control"
																	id="pr_needman" name="pr_needman" required="required"
																	type="text" value="${pr_needman }"> <span
																	class="input-group-addon">��</span>
															</div>
															<span class="help-block">�ʿ��� �ο����� ���ڷ� �����ּ���.</span>
														</div>
													</div>

													<div class="form-group description-form-group ">
														<label class="control-label required" for="description"><span>*</span>������Ʈ
															����</label>
														<div class="control-wrapper">
															<textarea autocomplete="off" class="form-control"
																cols="40" id="pr_content" name="pr_content" required=""
																rows="30">${pr_content }</textarea>
															<span class="help-block"><p class="text-danger">
																	<span class="label label-danger">����</span> �̸���, ��ȭ��ȣ ����
																	�Խ��ϴ� ��� ���� �̿뿡 ���縦 ���� �� �ֽ��ϴ�.
																</p></span>
														</div>
													</div>

													<div class="form-group ">
														<label class="control-label required" for="skill_required"><span>*</span>����
															���</label>
														<div class="control-wrapper">
															<input class="tagit-hidden-field" id="skill_required"
																name="skill_required" type="text">
																<div>
																	<input type="checkbox" name="pr_skills" id="pr_skills"
																		value="java" size=40>java <input
																		type="checkbox" name="pr_skills" id="pr_skills"
																		value="jsp" size=40>jsp <input type="checkbox"
																			name="pr_skills" id="pr_skills" value="android"
																			size=40>android <input type="checkbox"
																				name="pr_skills" id="pr_skills" value="html" size=40>html


																			
																</div> <span class="help-block">(�ִ� 5��) </span>
														</div>
													</div>

													<div class="form-group ">
														<label class="control-label required" for="skill_required"><span>*</span>��������</label>
														<div class="control-wrapper">

															<c:if test="${pr_private=='y' }">
										���� ���� ������Ʈ�Դϴ�.<br />
															</c:if>
															<c:if test="${pr_private=='n' }">
										���� ����� ������Ʈ�Դϴ�.<br />
															</c:if>
															<select name="pr_private">
																<option selected="selected" value="y">����</option>
																<option value="n">�����</option>
															</select>

														</div>
													</div>

													<div class="form-group ">
														<label class="control-label required" for="skill_required">����÷��</label>
														<div class="control-wrapper">
															<input type="file" name="pr_photo" id="pr_photo">
														</div>
													</div>

													<div>
														<div>
															��������<input type="checkbox" name="deletephoto"
																value="deletephoto">
														</div>
													</div>



													<div class="form-group">
														<div class="btn-wrapper">
															<input
																class="btn btn-lg btn-client js-disable-on-click btn-submit"
																value="������Ʈ ����" type="submit"> <input
																class="btn btn-lg btn-default js-disable-on-click"
																name="save_for_later" value="���" type="button">
														</div>
													</div>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>

</body>


</html>

