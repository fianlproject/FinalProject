<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" async=""
	src="/pfinal/js/mixpanel-2.2.min.js"></script>
<script async="" src="/pfinal/js/analytics.js"></script>
<script src="/pfinal/js/json2.js"></script>
<link href="/pfinal/css/7911bc0a5c62.css"
	rel="stylesheet" type="text/css">
<link href="/pfinal/css/33f4c32b6489.css"
	rel="stylesheet" type="text/css">
<!--[if IE 7]><link rel="stylesheet" href="/static/CACHE/css/c8ab8de16cbd.css" type="text/css" /><![endif]-->
<!--[if IE 8]><link rel="stylesheet" href="/static/CACHE/css/cdb287f057fa.css" type="text/css" /><![endif]-->
<link
	href="http://www.wishket.com/static/django_facebook/css/facebook.css"
	media="all" rel="stylesheet">
<!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<script src="/pfinal/js/a52a868564de.js"
	type="text/javascript"></script>
<link href="http://www.wishket.com/static/css/layout_nav.css"
	rel="stylesheet">
<link href="http://www.wishket.com/static/css/p5.css" rel="stylesheet">
<link href="http://www.wishket.com/static/css/floating.css"
	rel="stylesheet">
<script src="/pfinal/js/wcslog.js"
	type="text/javascript"></script>
<link href="http://www.wishket.com/static/favicon.ico"
	rel="shortcut icon" type="image/x-icon">
<link href="http://www.wishket.com/static/favicon.ico" rel="icon"
	type="image/x-icon">
<link href="http://www.wishket.com/static/touch-icon-ipad.png"
	rel="apple-touch-icon" sizes="76x76">
<link href="http://www.wishket.com/static/touch-icon-iphone-retina.png"
	rel="apple-touch-icon" sizes="120x120">
<link href="http://www.wishket.com/static/touch-icon-ipad-retina.png"
	rel="apple-touch-icon" sizes="152x152">
<script src="/pfinal/js/cb793deb7347.js"
	type="text/javascript"></script>
<script src="/pfinal/js/c3617c8217d0.js"
	type="text/javascript"></script>
<style type="text/css">
.fb_hidden {
	position: absolute;
	top: -10000px;
	z-index: 10001
}

.fb_invisible {
	display: none
}

.fb_reset {
	background: none;
	border: 0;
	border-spacing: 0;
	color: #000;
	cursor: auto;
	direction: ltr;
	font-family: "lucida grande", tahoma, verdana, arial, sans-serif;
	font-size: 11px;
	font-style: normal;
	font-variant: normal;
	font-weight: normal;
	letter-spacing: normal;
	line-height: 1;
	margin: 0;
	overflow: visible;
	padding: 0;
	text-align: left;
	text-decoration: none;
	text-indent: 0;
	text-shadow: none;
	text-transform: none;
	visibility: visible;
	white-space: normal;
	word-spacing: normal
}

.fb_reset>div {
	overflow: hidden
}

.fb_link img {
	border: none
}

.fb_dialog {
	background: rgba(82, 82, 82, .7);
	position: absolute;
	top: -10000px;
	z-index: 10001
}

.fb_reset .fb_dialog_legacy {
	overflow: visible
}

.fb_dialog_advanced {
	padding: 10px;
	-moz-border-radius: 8px;
	-webkit-border-radius: 8px;
	border-radius: 8px
}

.fb_dialog_content {
	background: #fff;
	color: #333
}

.fb_dialog_close_icon {
	background:
		url(http://static.ak.fbcdn.net/rsrc.php/v2/yq/r/IE9JII6Z1Ys.png)
		no-repeat scroll 0 0 transparent;
	_background-image:
		url(http://static.ak.fbcdn.net/rsrc.php/v2/yL/r/s816eWC-2sl.gif);
	cursor: pointer;
	display: block;
	height: 15px;
	position: absolute;
	right: 18px;
	top: 17px;
	width: 15px
}

.fb_dialog_mobile .fb_dialog_close_icon {
	top: 5px;
	left: 5px;
	right: auto
}

.fb_dialog_padding {
	background-color: transparent;
	position: absolute;
	width: 1px;
	z-index: -1
}

.fb_dialog_close_icon:hover {
	background:
		url(http://static.ak.fbcdn.net/rsrc.php/v2/yq/r/IE9JII6Z1Ys.png)
		no-repeat scroll 0 -15px transparent;
	_background-image:
		url(http://static.ak.fbcdn.net/rsrc.php/v2/yL/r/s816eWC-2sl.gif)
}

.fb_dialog_close_icon:active {
	background:
		url(http://static.ak.fbcdn.net/rsrc.php/v2/yq/r/IE9JII6Z1Ys.png)
		no-repeat scroll 0 -30px transparent;
	_background-image:
		url(http://static.ak.fbcdn.net/rsrc.php/v2/yL/r/s816eWC-2sl.gif)
}

.fb_dialog_loader {
	background-color: #f6f7f8;
	border: 1px solid #606060;
	font-size: 24px;
	padding: 20px
}

.fb_dialog_top_left, .fb_dialog_top_right, .fb_dialog_bottom_left,
	.fb_dialog_bottom_right {
	height: 10px;
	width: 10px;
	overflow: hidden;
	position: absolute
}

.fb_dialog_top_left {
	background:
		url(http://static.ak.fbcdn.net/rsrc.php/v2/ye/r/8YeTNIlTZjm.png)
		no-repeat 0 0;
	left: -10px;
	top: -10px
}

.fb_dialog_top_right {
	background:
		url(http://static.ak.fbcdn.net/rsrc.php/v2/ye/r/8YeTNIlTZjm.png)
		no-repeat 0 -10px;
	right: -10px;
	top: -10px
}

.fb_dialog_bottom_left {
	background:
		url(http://static.ak.fbcdn.net/rsrc.php/v2/ye/r/8YeTNIlTZjm.png)
		no-repeat 0 -20px;
	bottom: -10px;
	left: -10px
}

.fb_dialog_bottom_right {
	background:
		url(http://static.ak.fbcdn.net/rsrc.php/v2/ye/r/8YeTNIlTZjm.png)
		no-repeat 0 -30px;
	right: -10px;
	bottom: -10px
}

.fb_dialog_vert_left, .fb_dialog_vert_right, .fb_dialog_horiz_top,
	.fb_dialog_horiz_bottom {
	position: absolute;
	background: #525252;
	filter: alpha(opacity = 70);
	opacity: .7
}

.fb_dialog_vert_left, .fb_dialog_vert_right {
	width: 10px;
	height: 100%
}

.fb_dialog_vert_left {
	margin-left: -10px
}

.fb_dialog_vert_right {
	right: 0;
	margin-right: -10px
}

.fb_dialog_horiz_top, .fb_dialog_horiz_bottom {
	width: 100%;
	height: 10px
}

.fb_dialog_horiz_top {
	margin-top: -10px
}

.fb_dialog_horiz_bottom {
	bottom: 0;
	margin-bottom: -10px
}

.fb_dialog_iframe {
	line-height: 0
}

.fb_dialog_content .dialog_title {
	background: #6d84b4;
	border: 1px solid #3a5795;
	color: #fff;
	font-size: 14px;
	font-weight: bold;
	margin: 0
}

.fb_dialog_content .dialog_title>span {
	background:
		url(http://static.ak.fbcdn.net/rsrc.php/v2/yd/r/Cou7n-nqK52.gif)
		no-repeat 5px 50%;
	float: left;
	padding: 5px 0 7px 26px
}

body.fb_hidden {
	-webkit-transform: none;
	height: 100%;
	margin: 0;
	overflow: visible;
	position: absolute;
	top: -10000px;
	left: 0;
	width: 100%
}

.fb_dialog.fb_dialog_mobile.loading {
	background:
		url(http://static.ak.fbcdn.net/rsrc.php/v2/ya/r/3rhSv5V8j3o.gif) white
		no-repeat 50% 50%;
	min-height: 100%;
	min-width: 100%;
	overflow: hidden;
	position: absolute;
	top: 0;
	z-index: 10001
}

.fb_dialog.fb_dialog_mobile.loading.centered {
	max-height: 590px;
	min-height: 590px;
	max-width: 500px;
	min-width: 500px
}

#fb-root #fb_dialog_ipad_overlay {
	background: rgba(0, 0, 0, .45);
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	min-height: 100%;
	z-index: 10000
}

#fb-root #fb_dialog_ipad_overlay.hidden {
	display: none
}

.fb_dialog.fb_dialog_mobile.loading iframe {
	visibility: hidden
}

.fb_dialog_content .dialog_header {
	-webkit-box-shadow: white 0 1px 1px -1px inset;
	background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#738ABA),
		to(#2C4987));
	border-bottom: 1px solid;
	border-color: #1d4088;
	color: #fff;
	font: 14px Helvetica, sans-serif;
	font-weight: bold;
	text-overflow: ellipsis;
	text-shadow: rgba(0, 30, 84, .296875) 0 -1px 0;
	vertical-align: middle;
	white-space: nowrap
}

.fb_dialog_content .dialog_header table {
	-webkit-font-smoothing: subpixel-antialiased;
	height: 43px;
	width: 100%
}

.fb_dialog_content .dialog_header td.header_left {
	font-size: 12px;
	padding-left: 5px;
	vertical-align: middle;
	width: 60px
}

.fb_dialog_content .dialog_header td.header_right {
	font-size: 12px;
	padding-right: 5px;
	vertical-align: middle;
	width: 60px
}

.fb_dialog_content .touchable_button {
	background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#4966A6),
		color-stop(.5, #355492), to(#2A4887));
	border: 1px solid #2f477a;
	-webkit-background-clip: padding-box;
	-webkit-border-radius: 3px;
	-webkit-box-shadow: rgba(0, 0, 0, .117188) 0 1px 1px inset,
		rgba(255, 255, 255, .167969) 0 1px 0;
	display: inline-block;
	margin-top: 3px;
	max-width: 85px;
	line-height: 18px;
	padding: 4px 12px;
	position: relative
}

.fb_dialog_content .dialog_header .touchable_button input {
	border: none;
	background: none;
	color: #fff;
	font: 12px Helvetica, sans-serif;
	font-weight: bold;
	margin: 2px -12px;
	padding: 2px 6px 3px 6px;
	text-shadow: rgba(0, 30, 84, .296875) 0 -1px 0
}

.fb_dialog_content .dialog_header .header_center {
	color: #fff;
	font-size: 16px;
	font-weight: bold;
	line-height: 18px;
	text-align: center;
	vertical-align: middle
}

.fb_dialog_content .dialog_content {
	background:
		url(http://static.ak.fbcdn.net/rsrc.php/v2/y9/r/jKEcVPZFk-2.gif)
		no-repeat 50% 50%;
	border: 1px solid #555;
	border-bottom: 0;
	border-top: 0;
	height: 150px
}

.fb_dialog_content .dialog_footer {
	background: #f6f7f8;
	border: 1px solid #555;
	border-top-color: #ccc;
	height: 40px
}

#fb_dialog_loader_close {
	float: left
}

.fb_dialog.fb_dialog_mobile .fb_dialog_close_button {
	text-shadow: rgba(0, 30, 84, .296875) 0 -1px 0
}

.fb_dialog.fb_dialog_mobile .fb_dialog_close_icon {
	visibility: hidden
}

.fb_iframe_widget {
	display: inline-block;
	position: relative
}

.fb_iframe_widget span {
	display: inline-block;
	position: relative;
	text-align: justify
}

.fb_iframe_widget iframe {
	position: absolute
}

.fb_iframe_widget_fluid_desktop, .fb_iframe_widget_fluid_desktop span,
	.fb_iframe_widget_fluid_desktop iframe {
	max-width: 100%
}

.fb_iframe_widget_fluid_desktop iframe {
	min-width: 220px;
	position: relative
}

.fb_iframe_widget_lift {
	z-index: 1
}

.fb_hide_iframes iframe {
	position: relative;
	left: -10000px
}

.fb_iframe_widget_loader {
	position: relative;
	display: inline-block
}

.fb_iframe_widget_fluid {
	display: inline
}

.fb_iframe_widget_fluid span {
	width: 100%
}

.fb_iframe_widget_loader iframe {
	min-height: 32px;
	z-index: 2;
	zoom: 1
}

.fb_iframe_widget_loader .FB_Loader {
	background:
		url(http://static.ak.fbcdn.net/rsrc.php/v2/y9/r/jKEcVPZFk-2.gif)
		no-repeat;
	height: 32px;
	width: 32px;
	margin-left: -16px;
	position: absolute;
	left: 50%;
	z-index: 4
}
</style>
</head>
<body class="logged-in partners partners-setting">
	<div id="wrap">
		<div class="page">
			<div class="page-inner">
				<div class="content">
					<div class="content-inner" style="padding-top: 15px">
						<section class="p5-partition-title">
							<h3 class="header-text" style="margin-bottom: 30px">
								��Ʈ������ ��� 
							</h3>
						</section>
						<section class="p5-section">
							<form action="/pfinal/pfinal.do?command=projectupload"
								enctype="multipart/form-data" id="p5-fix-portfolio-form"
								method="POST" >
								<div class="form-group p5-portfolio-form-group">
									<label class="control-label required p5-box-control-label"
										for=""><span>*</span>����</label>
									<div class="control-wrapper">
										<input class="form-control p5-portfolio-form-title"
											data-validation="required" id="p5-form-title" name="title"
											required="required" type="text">
									</div>
								</div>
								<div class="form-group p5-portfolio-form-group">
									<label class="control-label required p5-box-control-label"
										for=""><span>*</span>ī�װ�</label>
									<div class="control-wrapper p5-2-control-wrapper">
										<select class="form-control" data-validation="required"
											id="p5-form-category" name="categoryId"><option
												selected="selected" value="">ī�װ�</option>
											<option value="2">����</option>
											<option value="1">������</option></select><select class="form-control"
											data-validation="required" id="p5-form-subcategory"
											name="subcategoryId"><option selected="selected"
												value="">���� ī�װ�</option></select>
									</div>
								</div>
								<div class="form-group p5-portfolio-form-group">
									<label class="control-label required" for=""><span>*</span>����</label>
									<div class="control-wrapper">
										<textarea class="form-control p5-portfolio-description"
											cols="80" data-validation="required" id="p5-form-description"
											name="description" required="" rows="10"></textarea>
									</div>
									<span class="p5-portfolio-information"
										id="p5-form-description-information">�ѱ� ���� 5000�� �̸�</span>
								</div>
								<div
									class="form-group year-month-widget p5-portfolio-form-group">
									<label class="control-label required p5-box-control-label"
										for=""><span>*</span>���� ������</label>
									<div class="control-wrapper p5-2-control-wrapper">
										<select class="begin form-control p5-date-select"
											data-validation="required" id="p5-form-begin-year"
											name="participationBeginYear"><option
												selected="selected" value="">��</option>
											<option value="2015">2015��</option>
											<option value="2014">2014��</option>
											<option value="2013">2013��</option>
											<option value="2012">2012��</option>
											<option value="2011">2011��</option>
											<option value="2010">2010��</option>
											<option value="2009">2009��</option>
											<option value="2008">2008��</option>
											<option value="2007">2007��</option>
											<option value="2006">2006��</option>
											<option value="2005">2005��</option>
											<option value="2004">2004��</option>
											<option value="2003">2003��</option>
											<option value="2002">2002��</option>
											<option value="2001">2001��</option>
											<option value="2000">2000��</option>
											<option value="1999">1999��</option>
											<option value="1998">1998��</option>
											<option value="1997">1997��</option>
											<option value="1996">1996��</option>
											<option value="1995">1995��</option>
											<option value="1994">1994��</option>
											<option value="1993">1993��</option>
											<option value="1992">1992��</option>
											<option value="1991">1991��</option>
											<option value="1990">1990��</option>
											<option value="1989">1989��</option>
											<option value="1988">1988��</option>
											<option value="1987">1987��</option>
											<option value="1986">1986��</option></select><select
											class="form-control" data-validation="required"
											id="p5-form-begin-month" name="participationBeginMonth"><option
												selected="selected" value="">��</option>
											<option value="1">1��</option>
											<option value="2">2��</option>
											<option value="3">3��</option>
											<option value="4">4��</option>
											<option value="5">5��</option>
											<option value="6">6��</option>
											<option value="7">7��</option>
											<option value="8">8��</option>
											<option value="9">9��</option>
											<option value="10">10��</option>
											<option value="11">11��</option>
											<option value="12">12��</option></select>
									</div>
								</div>
								<div
									class="form-group year-month-widget p5-portfolio-form-group">
									<label class="control-label required p5-box-control-label"
										for=""><span>*</span>���� ������</label>
									<div class="control-wrapper p5-2-control-wrapper">
										<select class="form-control p5-date-select"
											data-validation="required" id="p5-form-end-year"
											name="participationEndYear"><option
												selected="selected" value="">��</option>
											<option value="2015">2015��</option>
											<option value="2014">2014��</option>
											<option value="2013">2013��</option>
											<option value="2012">2012��</option>
											<option value="2011">2011��</option>
											<option value="2010">2010��</option>
											<option value="2009">2009��</option>
											<option value="2008">2008��</option>
											<option value="2007">2007��</option>
											<option value="2006">2006��</option>
											<option value="2005">2005��</option>
											<option value="2004">2004��</option>
											<option value="2003">2003��</option>
											<option value="2002">2002��</option>
											<option value="2001">2001��</option>
											<option value="2000">2000��</option>
											<option value="1999">1999��</option>
											<option value="1998">1998��</option>
											<option value="1997">1997��</option>
											<option value="1996">1996��</option>
											<option value="1995">1995��</option>
											<option value="1994">1994��</option>
											<option value="1993">1993��</option>
											<option value="1992">1992��</option>
											<option value="1991">1991��</option>
											<option value="1990">1990��</option>
											<option value="1989">1989��</option>
											<option value="1988">1988��</option>
											<option value="1987">1987��</option>
											<option value="1986">1986��</option></select><select
											class="form-control" data-validation="required"
											id="p5-form-end-month" name="participationEndMonth"
											required=""><option selected="selected" value="">��</option>
											<option value="1">1��</option>
											<option value="2">2��</option>
											<option value="3">3��</option>
											<option value="4">4��</option>
											<option value="5">5��</option>
											<option value="6">6��</option>
											<option value="7">7��</option>
											<option value="8">8��</option>
											<option value="9">9��</option>
											<option value="10">10��</option>
											<option value="11">11��</option>
											<option value="12">12��</option></select>
									</div>
								</div>
								<div class="form-group p5-portfolio-form-group">
									<label class="control-label required p5-box-control-label"
										for=""><span>*</span>������</label>
									<div class="control-wrapper p5-participation-control-wrapper">
										<input class="form-control p5-portfolio-participation-rate"
											data-slider-max="100" data-slider-min="1"
											data-slider-selection="before" data-slider-step="1"
											id="p5-form-participation-rate" name="participationRate"
											required="" type="text" value=""><span
											class="p5-percent">%</span>
									</div>
									<span class="p5-portfolio-information"
										id="p5-participation-rate-infomation">�������� 1���� 100����
										������ �Է��� �� �ֽ��ϴ�.</span>
								</div>
								<div class="p5-portfolio-img-information">
									��Ʈ������ �̹����� ���� 632px�� ��ȯ�Ǿ� �������ϴ�.<br> �̹��� ����(.jpg, .jpeg,
									.png, .gif ��)�� ���ε��� �� �ֽ��ϴ�.<br> ���� ũ��� �ִ� 5MB���� ���ε尡
									�����մϴ�.<br>
								</div>
								<div class="form-group p5-portfolio-form-group">
									<label class="control-label required p5-box-control-label"
										for="">��ǥ �̹���</label>
									<div class="p5-portfoilo-img-control-wrapper">
										<div>
											<span class="p5-img-name" id="p5-image-name-1">�̹�����
												������ּ���.</span> <span class="p5-custom-file-type-input-wrapper"><button
													class="btn btn-primary p5-custom-file-type-front"
													type="button">
													<i class="fa fa-plus"></i> �̹��� ����
												</button>
												<input accept="image/*" class="p5-custom-file-type-input"
												id="p5-file-btn-1" name="image1" type="file">
											<button class="btn btn-cancel p5-img-del-btn" type="button">����</button></span>
										</div>
									</div>
								</div>
								<div class="form-group p5-portfolio-form-group">
									<label class="control-label p5-box-control-label" for="">��
										�� ����</label>
									<div class="control-wrapper">
										<input class="form-control p5-form-comment" disabled=""
											id="p5-img1-description" name="caption1" type="text">
									</div>
									<span class="p5-portfolio-information"
										id="p5-caption1-infomation">�ѱ� ���� 120�� �̸�</span>
								</div>
								<div class="form-group p5-portfolio-form-group">
									<label class="control-label required p5-box-control-label"
										for="">�̹���</label>
									<div class="p5-portfoilo-img-control-wrapper">
										<div>
											<span class="p5-img-name" id="p5-image-name-2">�̹�����
												������ּ���.</span> <span class="p5-custom-file-type-input-wrapper"><button
													class="btn btn-primary p5-custom-file-type-front"
													type="button">
													<i class="fa fa-plus"></i> �̹��� ����
												</button>
												<input accept="image/*" class="p5-custom-file-type-input"
												id="p5-file-btn-2" name="image2" type="file">
											<button class="btn btn-cancel p5-img-del-btn" type="button">����</button></span>
										</div>
									</div>
								</div>
								<div class="form-group p5-portfolio-form-group">
									<label class="control-label p5-box-control-label" for="">��
										�� ����</label>
									<div class="control-wrapper">
										<input class="form-control p5-form-comment" disabled=""
											id="p5-img2-description" name="caption2" type="text">
									</div>
									<span class="p5-portfolio-information"
										id="p5-caption2-infomation">�ѱ� ���� 120�� �̸�</span>
								</div>
								<div class="form-group p5-portfolio-form-group">
									<label class="control-label required p5-box-control-label"
										for="">�̹���</label>
									<div class="p5-portfoilo-img-control-wrapper">
										<div>
											<span class="p5-img-name" id="p5-image-name-3">�̹�����
												������ּ���.</span> <span class="p5-custom-file-type-input-wrapper"><button
													class="btn btn-primary p5-custom-file-type-front"
													type="button">
													<i class="fa fa-plus"></i> �̹��� ����
												</button>
												<input accept="image/*" class="p5-custom-file-type-input"
												id="p5-file-btn-3" name="image3" type="file">
											<button class="btn btn-cancel p5-img-del-btn" type="button">����</button></span>
										</div>
									</div>
								</div>
								<div class="form-group p5-portfolio-form-group">
									<label class="control-label p5-box-control-label" for="">��
										�� ����</label>
									<div class="control-wrapper">
										<input class="form-control p5-form-comment" disabled=""
											id="p5-img3-description" name="caption3" type="text">
									</div>
									<span class="p5-portfolio-information"
										id="p5-caption3-infomation">�ѱ� ���� 120�� �̸�</span>
								</div>
								<div class="form-group p5-portfolio-form-group">
									<label class="control-label p5-box-control-label" for="">�±�</label>
									<div class="control-wrapper p5-tag-form-wrapper">
										<ul class="p5-tag-form-unit-group">
											<li><input class="form-control portfolio_title"
												id="p5-form-tag-input" name="tagList" type="text"></li>
										</ul>
									</div>
									<span class="p5-portfolio-information">�ټ��� ���� ����� �Է�
										�Ҷ����� ��ǥ(,)�� ������ �ּ���. (�ִ� 5��)<br>��) Photoshop, Android,
										HTML5, Python, Django
									</span>
								</div>
								<span class="pull-right p5-portfolio-btn-group">
								<a class="btn btn-cancel p5-btn-left" id="p5-portfolio-cancel-btn" href="">���</a>
								<button class="btn btn-partners p5-submit-portfolio-btn" type="submit">�߰�</button></span>
							</form>
						</section>
					</div>
				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>
	<script>
    $(document).ready( function() {

		var split = location.href.split('/');
        var slug = split[5];
        var portfolioTitle='';
        var tagCnt=0;


//         $('#p5-portfolio-cancel-btn').attr('href',wishketUrl+'/partners/p/'+slug+'/portfolio/update');
//         $('#p5-fix-portfolio-form').attr('action',serverUrl+'/api/updatePortfolios');
        //���� ���ϴ� �κ�
        var d = new Date();
        for(var i=0;i < 30; i++) {
            var temp = '<option value="'+(parseInt(d.getFullYear())-i)+'">'+
                            (parseInt(d.getFullYear())-i)+'��'+
                        '</option>';
            $('.p5-date-select').append(temp);
        }

        $('.content-inner').on('change','#p5-form-category', function() {
            getSubCategory(this);
        });


        //textarea ���ڿ� ����
        $('.content-inner').on('keyup','#p5-form-description', function(e) {
            if($(this).val().length > 5000) {
                $('#p5-form-description-information').css('color','#f33d12');
                setTimeout( function() {
                    $('#p5-form-description-information').css('color','#999');
                }, 600);
                $(this).val($(this).val().substr(0,5000));
            } else {
                $('#p5-form-description-information').css('color','#999');
            }
        });
        //tag text
        $('.content-inner').on('keyup', '#p5-form-tag-input', function(event) {


            if(event.which==188||event.which==32) {
                if($('.p5-tag-form-unit-group').children().length < 6) {
                    var valid = true;

                    //30�� �Ѿ���� �˻�
                    if($(this).val().length > 30 ) {
                        valid = false;
                        $(this).val("");
                    }

                    //�ߺ����� �˻�
                    for(var i=0;i < $('.p5-tag-form-unit-group').children().length; i++) {
                        if($('.p5-tag-form-unit-val').eq(i).text().trim() === $(this).val().replace(',','').trim()) {
                           //�ߺ��� �±� ��׶��� �� ��� �ٲ�
                            var temp = $('.p5-tag-form-unit-val').eq(i).parent();
                            temp.css('background-color','#fffc9a');
                            setTimeout( function() {
                                temp.css('background-color','#fff');
                            }, 700);
                            valid = false;
                            break;
                        }
                    }

                    if(valid == true) {
                        var tag = '<li><div class="p5-tag-form-unit"><span class="p5-tag-form-unit-val">'+$(this).val().replace(',','')+'</span><a href="#" class="p5-form-tag-delete-btn">x</a></div><input type="hidden" name="tagList" value="'+$(this).val().replace(',','')+'"></li>';
                        tag += '<li><input id="p5-form-tag-input" class="form-control portfolio_title" name="title" type="text"></li>';
                        tagCnt++;
                        $(this).parent().remove();
                        $('.p5-tag-form-unit-group').append(tag);

                        $('#p5-form-tag-input').focus();

                    }
                }

            }
        });

        $('.content-inner').on('keydown', '#p5-form-tag-input', function(event) {
            if(event.which==8&&$(this).val()==""&&tagCnt!=0) {//backspace
                $('.p5-tag-form-unit-group li:nth-child('+tagCnt+')').remove();
                tagCnt--;
            }
        });

        //tag delete btn
        $('.content-inner').on('click','.p5-form-tag-delete-btn', function(e) {
            e.preventDefault();
            $(this).parent().parent().remove();
        });

        //img delete btn
        $('.content-inner').on('click','.p5-img-del-btn',function() {

            if($(this).siblings('input').attr('name')=='image1') {
                var imgAssignTag = '<button type="button" class="btn btn-primary p5-custom-file-type-front"><i class="fa fa-plus"></i>&nbsp;�̹��� ����</button>'+
                                   '<input id="p5-file-btn-1" type="file" name="image1" class="p5-custom-file-type-input" accept="image/*">'+
                                   '<button type="button" class="btn btn-cancel p5-img-del-btn">����</button>';
                $('#p5-img1-description').attr('disabled',true);
                $('#p5-img1-description').val('');
                $('#p5-image-name-1').html('�̹����� ������ּ���.');
                $('#p5-file-btn-1').parent().html(imgAssignTag);
            } else if ($(this).siblings('input').attr('name')=='image2') {
                var imgAssignTag = '<button type="button" class="btn btn-primary p5-custom-file-type-front"><i class="fa fa-plus"></i>&nbsp;�̹��� ����</button>'+
                                   '<input id="p5-file-btn-2" type="file" name="image2" class="p5-custom-file-type-input" accept="image/*">'+
                                   '<button type="button" class="btn btn-cancel p5-img-del-btn">����</button>';

                $('#p5-img2-description').attr('disabled',true);
                $('#p5-img2-description').val('');
                $('#p5-image-name-2').html('�̹����� ������ּ���.');
                $('#p5-file-btn-2').parent().html(imgAssignTag);
            } else if ($(this).siblings('input').attr('name')=='image3') {
                var imgAssignTag = '<button type="button" class="btn btn-primary p5-custom-file-type-front"><i class="fa fa-plus"></i>&nbsp;�̹��� ����</button>'+
                                   '<input id="p5-file-btn-3" type="file" name="image3" class="p5-custom-file-type-input" accept="image/*">'+
                                   '<button type="button" class="btn btn-cancel p5-img-del-btn">����</button>';
                $('#p5-img3-description').attr('disabled',true);
                $('#p5-img3-description').val('');
                $('#p5-image-name-3').html('�̹����� ������ּ���.');
                $('#p5-file-btn-3').parent().html(imgAssignTag);
            }

            $(this).siblings('input').val("");
            $(this).parent().siblings('.p5-img-name').html("�̹����� ������ּ���.");
        });

        //�̹��� ���� ��ư��
        $('.content-inner').on('change','#p5-file-btn-1', function() {
            if($('#p5-file-btn-1').val()==='') {
                //donothing
            } else {
                $('#p5-image-name-1').html($(this).val().split(/(\\|\/)/g).pop());
                image=document.getElementById('p5-file-btn-1');
                $('#p5-img1-description').attr('disabled',false); //ĸ�� ����


            }
        });

        $('.content-inner').on('change','#p5-file-btn-2', function() {
             if($('#p5-file-btn-2').val()==='') {
                //donothing
            } else {
                $('#p5-image-name-2').html($(this).val().split(/(\\|\/)/g).pop());
                image=document.getElementById('p5-file-btn-2');
                $('#p5-img2-description').attr('disabled',false); //ĸ�� ����

            }
        });

        $('.content-inner').on('change','#p5-file-btn-3', function() {
             if($('#p5-file-btn-3').val()==='') {
                //donothing
            } else {
                $('#p5-image-name-3').html($(this).val().split(/(\\|\/)/g).pop());
                image=document.getElementById('p5-file-btn-3');
                $('#p5-img3-description').attr('disabled',false); //ĸ�� ����

            }
        });
        //������ ���� üũ
        $('.content-inner').on('keyup','#p5-form-participation-rate', function() {
            var temp = $('#p5-form-participation-rate').val();

            if(temp <= 100 && temp >= 1 && parseInt(temp) == temp) {
                $('#p5-participation-rate-infomation').css('color', '#555');
            } else {
                $('#p5-participation-rate-infomation').css('color', 'red');
            }
        });

        //�̹��� ĸ�� ���� üũ
        $('.content-inner').on('keyup','#p5-img1-description', function() {
            var temp = $('#p5-img1-description').val().length;

            if(temp <= 119) {
                $('#p5-caption1-infomation').css('color', '#555');
            } else {
                $('#p5-caption1-infomation').css('color', '#f33d12');
                setTimeout( function() {
                    $('#p5-caption1-infomation').css('color','#999');
                }, 600);
                $('#p5-img1-description').val($('#p5-img1-description').val().substr(0,119));
            }
        });


        $('.content-inner').on('keyup','#p5-img2-description', function() {
            var temp = $('#p5-img2-description').val().length;

            if(temp <= 119) {
                $('#p5-caption2-infomation').css('color', '#555');
            } else {
                $('#p5-caption2-infomation').css('color', '#f33d12');
                setTimeout( function() {
                    $('#p5-caption2-infomation').css('color','#999');
                }, 600);
                $('#p5-img2-description').val($('#p5-img2-description').val().substr(0,119));
            }
        });

        $('.content-inner').on('keyup','#p5-img3-description', function() {
            var temp = $('#p5-img3-description').val().length;

            if(temp <= 119) {
                $('#p5-caption3-infomation').css('color', '#555');
            } else {
                $('#p5-caption3-infomation').css('color', '#f33d12');
                setTimeout( function() {
                    $('#p5-caption3-infomation').css('color','#999');
                }, 600);
                $('#p5-img3-description').val($('#p5-img3-description').val().substr(0,119));
            }
        });


        $('.content-inner').on('click','.p5-submit-portfolio-btn', function(e) {
            e.preventDefault();
            var particiPationValid = $('#p5-form-participation-rate').val();
            var img1DescriptionValid = $('#p5-img1-description').val().length;
            var img2DescriptionValid = $('#p5-img1-description').val().length;
            var img3DescriptionValid = $('#p5-img1-description').val().length;
            var validation = true;

            //var fd = new FormData();
            var tagList= [];
            //tagList check
            if(notInValue('p5-form-title')) {
                validation = false;
            }
            if(notInValue('p5-form-category')) {
                validation = false;
            }
            if(notInValue('p5-form-subcategory')) {
                validation = false;
            }
            if(notInValue('p5-form-description')) {
                validation = false;
            }
            if(notInValue('p5-form-begin-year')) {
                validation = false;
            }
            if(notInValue('p5-form-begin-month')) {
                validation = false;
            }
            if(notInValue('p5-form-end-year')) {
                validation = false;
            }
            if(notInValue('p5-form-end-month')) {
                validation = false;
            }
            if(notInValue('p5-form-participation-rate')) {
                validation = false;
            }
            if(parseInt($('#p5-form-begin-year').val()) === parseInt($('#p5-form-end-year').val())){
                if(parseInt($('#p5-form-begin-month').val()) > parseInt($('#p5-form-end-month').val())){

                    $('#p5-form-begin-year').parent().addClass('has-error');
                    $('#p5-form-begin-month').parent().addClass('has-error');
                    $('#p5-form-end-year').parent().addClass('has-error');
                    $('#p5-form-end-month').parent().addClass('has-error');
                    validation = false;
                }
            }


            if(parseInt($('#p5-form-begin-year').val()) > parseInt($('#p5-form-end-year').val())) {

                $('#p5-form-begin-year').parent().addClass('has-error');
                $('#p5-form-begin-month').parent().addClass('has-error');
                $('#p5-form-end-year').parent().addClass('has-error');
                $('#p5-form-end-month').parent().addClass('has-error');
                validation = false;
            }

            if(particiPationValid > 100 || particiPationValid < 1 || parseInt(particiPationValid) != particiPationValid) {
                 validation = false;
            }

            if(img1DescriptionValid >= 120) {
                 validation = false;
            }

            if(img2DescriptionValid >= 120) {
                 validation = false;
            }

            if(img3DescriptionValid >= 120) {
                 validation = false;
            }

            if(validation == false) {
                return 0;
            }

            $('input[name="slug"]').val(slug);
            $('input[name="dataId"]').val(0);
            $('input[name="isImage1Changed"]').val(1);
            $('input[name="isImage2Changed"]').val(1);
            $('input[name="isImage3Changed"]').val(1);
            $('#p5-form-tag-input').remove();

            document.forms["p5-fix-portfolio-form"].submit();

        });
    });

    function getSubCategory(dom) {
        var temp='';

        if($(dom).val()==2) { //����
                temp = '<option selected="selected" value="">���� ī�װ�</option>' +
                        '<option value="1">��</option>'+
                        '<option value="2">���ø����̼�</option>'+
                        '<option value="3">����������</option>'+
                        '<option value="4">�ۺ���</option>'+
                        '<option value="5">Ŀ�ӽ�, ���θ�</option>'+
                        '<option value="6">�Ϲ� ����Ʈ����</option>'+
                        '<option value="7">�Ӻ����</option>'+
                        '<option value="8">��Ÿ</option>'+
                        '<option value="19">����</option>';
                $('#p5-form-subcategory').html(temp);
            } else if($(dom).val()==1) {//������
                temp = '<option selected="selected" value="">���� ī�װ�</option>' +
                        '<option value="9">��</option>'+
                        '<option value="10">���ø����̼�</option>'+
                        '<option value="11">��ǰ</option>'+
                        '<option value="12">���������̼�</option>'+
                        '<option value="13">�μ⹰</option>'+
                        '<option value="14">Ŀ�ӽ�, ���θ�</option>'+
                        '<option value="15">�ΰ�</option>'+
                        '<option value="17">�׷���</option>'+
                        '<option value="16">����</option>'+
                        '<option value="20">����</option>'+
                        '<option value="18">��Ÿ</option>';
                $('#p5-form-subcategory').html(temp);
            } else { //���� ����� �ȵ��� ��
                temp = '<option selected="selected" value="">���� ī�װ�</option>'
                $('#p5-form-subcategory').html(temp);
            }

    }

    function decodeSubCategory( subCategoryValue ) {
        if (subCategoryValue == 101) return 1; //��
        if (subCategoryValue == 102) return 2; //���ø����̼�
        if (subCategoryValue == 103) return 3; //����������
        if (subCategoryValue == 104) return 4; //�ۺ���
        if (subCategoryValue == 106) return 5; //Ŀ�ӽ�, ���θ�
        if (subCategoryValue == 105) return 6; //�Ϲ� ����Ʈ����
        if (subCategoryValue == 108) return 7; //�Ӻ����
        if (subCategoryValue == 109) return 8; //��Ÿ

        if (subCategoryValue == 201) return 9; //��
        if (subCategoryValue == 202) return 10; //���ø����̼�
        if (subCategoryValue == 203) return 11; //��ǰ
        if (subCategoryValue == 204) return 12; //���������̼�
        if (subCategoryValue == 205) return 13; //�μ⹰
        if (subCategoryValue == 206) return 14; //Ŀ�ӽ�, ���θ�
        if (subCategoryValue == 207) return 15; //�ΰ�
        if (subCategoryValue == 209) return 16; //����
        if (subCategoryValue == 208) return 17; //�׷���
        if (subCategoryValue == 211) return 18; //��Ÿ
        if (subCategoryValue == 107) return 19; //����
        if (subCategoryValue == 210) return 20; //����
    }

    function notInValue(formID) {
        if($('#'+formID).val()==""||$('#'+formID).val()==null||$('#'+formID).val()==undefined) {

            $('#'+formID).parent().addClass("has-error");
            //$('#'+formID).css('border-color', '#f33d12');
            $('#'+formID).addClass('error');
            $('#'+formID).parent().children('.form-error').remove();
            $('#'+formID).parent().append('<span class="help-block form-error"><i class="fa fa-exclamation-circle"></i> �� �׸��� �ʼ��Դϴ�.</span>');
            return true;
        } else {
            $('#'+formID).parent().removeClass("has-error");
            //$('#'+formID).css('border-color', '#f33d12');
            $('#'+formID).removeClass('error');
            $('#'+formID).parent().children('.form-error').remove();
            return false;
        }
    }
</script>
	<script type="text/javascript">
  $(function() {
    wishket.init();
    
    svgeezy.init(false, 'png');
  });
</script>
	<script>

$( document ).ready(function($) {
    var p5TotalSubNavigationFlag = 0;


	if ( $( window ).width() >= 1200 ) {
		$( '.p5-side-nav-deactive' ).css( 'display', 'none' );
	} else  {
		$( '.p5-side-nav-active' ).css( 'display', 'none' );
		$( '.p5-side-nav-deactive' ).css( 'display', 'block');
	}

	$('.content-inner').on('click', '.p5-side-nav-active-btn', function () {
		$('.p5-side-nav-active').css( 'display', 'none' );
		$('.p5-side-nav-deactive').css('display','block');
	});

	$('.content-inner').on('click', '.p5-side-nav-deactive-btn', function () {
		$('.p5-side-nav-active').css( 'display', 'block' );
		$('.p5-side-nav-deactive').css('display','none');
	});


    $( window ).scroll ( function () {
		if ( $(window).scrollTop() > 87 && p5TotalSubNavigationFlag === 0) {
			setTimeout(function() {
				$('#p5-total-sub-navigation-wrapper').removeClass('hide fadeOut');
				$('#p5-total-sub-navigation-wrapper').addClass('fadeInDown');
			}, 200 );
			flag = 1;


		} else if ( $(window).scrollTop() <= 87 ){
			p5TotalSubNavigationFlag = 0;
			$('#p5-total-sub-navigation-wrapper').removeClass('fadeInDown');
			$('#p5-total-sub-navigation-wrapper').addClass('fadeOut');
			setTimeout(function() {
				$('#p5-total-sub-navigation-wrapper').addClass('hide');
			}, 200 );
		}
	});
});

</script>

</body>
</html>