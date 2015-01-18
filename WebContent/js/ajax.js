var httpRequest = null;

function getXMLHttpRequest() {
	return new XMLHttpRequest();
}

function sendRequest( method , url , params , callback ) {
	httpRequest = getXMLHttpRequest();
	var httpMethod = method ? method : "get";
	if(httpMethod != "get" && httpMethod != "post"){
		httpMethod ="get";
	}
	
	var httpParams = (params == null || params =="")?null:params;
	
	var httpUrl = url;
	if(httpMethod == "get" && httpParams != null){
		httpUrl = httpUrl + "?" + httpParams;
	}
	httpRequest.open(httpMethod, httpUrl, "true");
	httpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=utf-8")
	httpRequest.onreadystatechange = callback;
	httpRequest.send(httpMethod=="post"?httpParams:null);
}