<%@page import="java.util.Map"%>
<%@page import="com.test.FolderStats"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
<form action="FolderStatsApi">
<input type="text" name="folderPath" placeholder="Please enter directory path">
<input type="submit" />
<br/>
<br/>
<br/>
<br/>
<%
	Object obj=request.getAttribute("folderStats");
	if(obj!=null){
		FolderStats folderStats=(FolderStats)obj;
		%>
		<h4 align="center">Folder stats</h4><br>
		<h5 align="center">Total directory size: <%=folderStats.size %> Bytes</h5>
		<table align="center">
		<tr><th>Type</th> <th>Count</th> </tr>
	<% 
		
		for (Map.Entry<String,Long> entry : folderStats.countByType.entrySet()) {
		%>
		<tr><td><%= entry.getKey() %></td><td> <td><%= entry.getValue()%></td> </tr>
		<%
 }
%>
</table>
<%
}

%>



</form>

</body>
</html>