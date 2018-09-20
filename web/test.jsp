<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="beans.*"%>

<html>
<head>
    <title>Users</title>

</head>

<body>

<%@include file="header.jsp"%>
<div>
    <%@include file="sidebar.jsp"%>
</div>



<div style="padding-top: 60px;">
    <div style="margin-left: 27%; float:left;">
        <h3 id="date"></h3>
    </div>
    <div style=" float:right;">
        <form action="/user/register" method="POST">
            <button  type="submit">Add User</button>
        </form>

    </div>
    <div style="margin-left:35%; padding-top:15%;border:4px solid grey; width:
500px; height: 400px; clear: both;">
        <div id="table_div"></div>

    </div>

    <br>
    <table border ='1'>
        <tr> <th> ID </th> <th> Username </th> <th> Email </th> <th> Password
        </th> <th> Name </th> <th> Phone </th> <th> Created Date </th>  <th>
            Last Login </th><th> Updated Date </th> </tr>


        <c:forEach items="${users}" var="item">
            <tr>
                <td><c:out value="${item.id}"/></td>
                <td><c:out value="${item.username}"/></td>
                <td><c:out value="${item.email}"/></td>
                <td><c:out value="${item.password}"/></td>
                <td><c:out value="${item.name}"/></td>
                <td><c:out value="${item.phone}"/></td>
                <td><c:out value="${item.lastLogin}"/></td>
                <td><c:out value="${item.createdAt}"/></td>
                <td><c:out value="${item.updatedAt}"/></td>
            </tr>

        </c:forEach>

    </table>

</div>
<div style="margin-left:50%; margin-top:30px;">
    <button><img src="images/search.png" height="20px"
                 width="20px"></button>
    <input type="search" id="searchUser" name="searchUser"
           placeholder="Search for a Sensor">
</div>
<br>

<div>

</div>
</div>

<script>
    var n =  new Date();
    var y = n.getFullYear();
    var m = n.getMonth() + 1;
    var d = n.getDate();
    document.getElementById("date").innerHTML = m + "/" + d + "/" + y;

</script>
</body>
</html>
