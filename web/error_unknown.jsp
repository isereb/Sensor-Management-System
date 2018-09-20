<%@ page isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="utf-8">
    <title>Error Unknown Page</title>
</head>

<body>

<%@include file="header.jsp"%>
<div>
    <%@include file="sidebar.jsp"%>
</div>
<div style="padding-top: 60px;">
<div style="margin-left: 25%; float:left;">
    <h3 id="date"></h3>
</div>
<div style=" float:right; top:60px;">
    <form action="/user/login" method="POST">
        <button  type="submit">Go Back</button>
    </form>

</div>
<div style="margin-left:35%;border:4px solid grey; width:
500px; height: 400px; clear: both;">
    <h3 class="w3-bar-item">${errors.name}</h3>
    <h3 class="w3-bar-item">${sqlErrors.name}</h3>
    <img src="images/error-oops.jpg" height="400px"
         width="500px">

</div>
</div>

<div>

</div>
</body>
</html>

