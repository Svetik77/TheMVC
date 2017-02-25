<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>

<html>
<head>
<title>UserData</title>


<style type="text/css">
  body {
	background-repeat: no-repeat;
	background-color: #FFFF00; /*yellow*/
}

.tg {
	border-collapse: collapse;
	border-spacing: 0;
	border-color: #ccc;
}

.tg td {
	font-family: Arial, sans-serif;
	font-size: 14px;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #fff;
}

.tg th {
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #f0f0f0;
}

.tg .tg-4eph {
	background-color: #f9f9f9
}
</style>


</head>
<body>
	<h1 style="color: fuchsia;">Users Details </h1>

	<table class="tg">
		<tr>
			<td width="80">id</td>
			<td width="120">name</td>
			<td width="120">age</td>
			<td width="120">admin</td>
			<td width="120">created date</td>
		</tr>
		<tr>
			<td>${user.id}</td>
			<td>${user.name}</td>
			<td>${user.age}</td>
		
		 <c:if test="${ user.admin eq 'false'}">
		    <td>no</td>
		 </c:if>
			
	     <c:if test="${ user.admin eq 'true'}">
		    <td>yes</td>
		 </c:if>
			
			<td>${user.createddate}</td>
		</tr>
	</table>
</body>
</html>