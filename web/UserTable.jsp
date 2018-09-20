<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>SMS | Dashboard</title>
    <link type="text/css" rel="stylesheet" href="https://semantic-ui.com/dist/semantic.min.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style/main.css" />

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
</head>
<body>
<div class="ui container">
    <div class="ui grid">
        <div class="four wide column">
            <c:import url="sidebar.jsp" />
        </div>
        <div class="twelve wide column">
            <h1 class="ui header">Users</h1>
            <a class="ui fluid icon green button"
               href="${pageContext.request.contextPath}/user/register">
                <i class="ui plus icon"></i>
                Add a new User
            </a>
            <br>
            <div>
                <table class="ui table">
                    <tr> <th > ID </th> <th> Username </th> <th> Email </th>
                        <th> Password
                    </th> <th> Name </th> <th> Phone </th> <th> Created Date </th>  <th>
                        Last Login </th><th> Updated Date </th> </tr>


                    <c:forEach items="${users}" var="item">
                        <tr style="font-size: 70%;">
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
    </div>
</div>
</div>
</body>
</html>

