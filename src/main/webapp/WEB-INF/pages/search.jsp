<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<html>
<head>
<title>Users search Page</title>

<style type="text/css">
body {
	background-repeat: no-repeat;
	background-color: #98FB98;
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
	<a href="../index.jsp">Back to main menu</a>
	<br />
	<h3 style="color: blue;">
		<c:out value="${ output}"></c:out>
	</h3>

	<br />
	<c:if test="${!empty listFoundsUsers}">
		<table class="tg">
			<tr>
				<td width="80">id</td>
				<td width="120">name</td>
				<td width="50">age</td>
				<td width="50">admin</td>
				<td width="160">created date</td>
				<td width="60">edit</td>
				<td width="60">delete</td>
			</tr>
			<c:forEach items="${listFoundsUsers}" var="user">
				<tr>
					<td>${user.id}</td>
					<td><a href="/userdata/${user.id}" target="_blank">${user.name}</a></td>
					<td>${user.age}</td>
					<c:if test="${user.admin eq 'false'}">
						<td>no</td>
					</c:if>

					<c:if test="${ user.admin eq 'true'}">
						<td>yes</td>
					</c:if>

					<td>${user.createddate}</td>
					<td><a href="<c:url value='/edit/${user.id}'/>">Edit</a></td>
					<td><a href="<c:url value='/remove/${user.id}'/>">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<br>
	<input type="button" onclick="location.href='../userspage?page=1';"
		value="back to list" />
</body>
</html>
