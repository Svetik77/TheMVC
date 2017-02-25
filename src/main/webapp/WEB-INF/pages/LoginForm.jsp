<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<html>
<head>
<title>Users Page LoginForm jsp</title>

<style type="text/css">

  body {
	background-repeat: no-repeat;
	background-color: #87CEEB;
}

.error {
	color: red;
	font-weight: bold;
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


	<h1 style="color: red">check name string, and age must be digit </h1>

	<c:url var="modifyAction" value="/userspage/modify" />

	<form:form action="${modifyAction}" commandName="user">
		<table>
			<c:if test="${!empty user.name}">
				<tr>
					<td><form:label path="id">
							<spring:message text="ID" />
						</form:label></td>
					<td><form:input path="id" readonly="true" size="8"
							disabled="true" /> <form:hidden path="id" ></form:hidden></td>
				</tr>
			</c:if>

			<!-- name -->

			<tr>
				<td><form:label path="name">
						<spring:message text="name" />
					</form:label></td>
				<td><form:input path="name" /></td>
			</tr>

			<!-- /name -->

			<!-- age -->

			<tr>
				<td><form:label path="age">
						<spring:message text="age" />
					</form:label></td>
				<td><form:input path="age" />
				<td><form:errors path="age" cssClass="error" /></td>
			</tr>

			<!-- / age -->
			<!-- admin -->

			<tr>
				<td><form:checkbox path="admin" value="false" /> <form:label
						path="admin">
						<spring:message text="admin" />
					</form:label></td>

			</tr>

			<!-- / admin -->

			<tr>
				<td colspan="2"><c:if test="${!empty user.name}">
						<input type="submit" value="<spring:message text="Edit name"/>" />
					</c:if> <c:if test="${empty user.name}">
						<input type="submit" value="<spring:message text="Add name"/>" />
					</c:if></td>
			</tr>
		</table>
	</form:form>

	<br />
	<br />
</html>
