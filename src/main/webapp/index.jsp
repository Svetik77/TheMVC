<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>user page</title>
  <style type="text/css">
  body {
	/* background-image: url("img/pavlin.jpg"); */
	/* background-repeat: no-repeat; */
	background-color: #CC99FF; /*violet*/
}
  </style>
</head>
<body>
<br/>
<br/>

<div style="text-align:center"><h1 style="color: #FFF68F;">Welcome </h1></div>
<br/>
<br/>

<div style="text-align:center"><h1 ><a href="<c:url value="userspage?page=1"/>" >Let's go to user page </a></h1></div>

<br>
<br>

<div style="text-align:center"><a href="<c:url value="userspage?page=1"/>"><img src="img/pushme.png"></a></div>

</body>
</html>