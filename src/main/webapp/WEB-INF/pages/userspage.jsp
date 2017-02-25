<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="false"%>
<html>
<head>
<title>Users Page</title>


<style type="text/css">
body {
	background-repeat: no-repeat;
	background-color: #FFC0CB; /*pink*/
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
	<a href="index.jsp">Back to main menu</a>
	<br />
	<br />

	<c:set var="parampage" value="${param.page}" />
	<fmt:parseNumber var="i" type="number" value="${parampage}" />
	<c:set var="leftlimit" value="${1}" />
	<c:url var="modifyAction" value="/userspage/modify" />

	<form:form action="${modifyAction}" commandName="user">
		<table>
			<c:if test="${!empty user.name}">
				<tr>
					<td><form:label path="id">
							<spring:message text="ID" />
						</form:label></td>
					<td><form:input path="id" readonly="true" size="8"
							disabled="true" /> <form:hidden path="id" /></td>
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
				<td><form:input path="age" value="" /> <%-- 				<td><form:errors path="age" cssClass="error" /></td> --%>
				<td><form:errors path="age" cssStyle="color: red;" /></td>
			</tr>
			<!-- / age -->

			<!-- admin -->
			<tr>
				<td><form:checkbox path="admin" value="false" /> <form:label
						path="admin">
						<spring:message text="admin" />
					</form:label></td>

				<td></td>
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

	<c:url var="searchAction" value="/userspage/search" />
	<form:form action="userspage/search" method="GET" commandName="user">
		<table>
			<!-- name -->
			<tr>
				<td><form:label path="name">
						<spring:message text="name" />
					</form:label></td>
				<td><form:input path="name" /></td>
			</tr>
			<!-- /name -->
			<tr>
				<td colspan="2"><input type="submit"
					value="<spring:message text="search user by name"/>" /></td>
			</tr>
		</table>

	</form:form>

	<c:set var="allUserList" value="${fn:length(listUsersPagesAll)}"></c:set>

	<!-- next, prev -->
	<c:if test="${i > leftlimit}">

		<input type="button" onclick="location.href='userspage?page=1';"
			value="FIRST" />

		<input type="button"
			onclick="location.href='userspage?page=${i - 1}';" value="PREV" />

	</c:if>
	<!-- for disabled button -->
	<c:if test="${i <= leftlimit}">

		<input type="button"  disabled="disabled"
		onclick="location.href='userspage?page=1';"
			value="FIRST" />

		<input type="button" disabled="disabled"
			onclick="location.href='userspage?page=${i - 1}';" value="PREV" />

	</c:if>
	
	
	<!-- next, prev -->
	<c:if test="${nomoreusers ne 'yes'}">
		<input type="button"
			onclick="location.href='userspage?page=${i + 1}';" value="NEXT" />
	</c:if>
	<c:if test="${nomoreusers eq 'yes'}">
		<input type="button" disabled="disabled"
			onclick="location.href='userspage?page=${i + 1}';" value="NEXT" />
	</c:if>
	
	

<!-- changed to if -->
	<c:if test="${nomoreusers ne 'yes'}">
		<input type="button"
			onclick="location.href='userspage?page=${numberOfPages}';"
			value="LAST" />
	</c:if>


<!-- changed to ifaaaaa -->

	<c:if test="${nomoreusers eq 'yes'}">
		<input type="button"  disabled="disabled"
			onclick="location.href='userspage?page=${numberOfPages}';"
			value="LAST" />
	</c:if>


	<h3 style="color: blue;">new user will placed to the last page</h3>

	<c:if test="${!empty listUsersPages}">
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
			<c:forEach items="${listUsersPages}" var="user">
				<tr>
					<td>${user.id}</td>
					<td><a href="/userdata/${user.id}" target="_blank">${user.name}</a></td>
					<td>${user.age}</td>

					<%-- <c:out value="${user.admin}"></c:out> --%>
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
</html>
