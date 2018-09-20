<%@ page contentType="text/html;charset=UTF-8" %>\
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title> SMS | Login Page </title>
    <link type="text/css" rel="stylesheet" href="https://semantic-ui.com/dist/semantic.min.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style/index.css" />
</head>

<body>
<div class="ui middle aligned center aligned grid">
    <div class="column">
        <h2 class="ui olive image header">
            <div class="content">
                Sensor Management System
            </div>
        </h2>
        <form class="ui large form" method="post" action="${pageContext.request.contextPath}/user/login">
            <div class="ui stacked segment">
                <div class="field">
                    <div class="ui left icon input">
                        <i class="user icon"></i>
                        <input type="text" name="username" placeholder="Username">
                    </div>
                </div>
                <div class="field">
                    <div class="ui left icon input">
                        <i class="lock icon"></i>
                        <input type="password" name="password" placeholder="Password">
                    </div>
                </div>
                <input class="ui fluid large olive submit button" type="submit" value="Sign in">
            </div>

            <c:if test="${errors ne null && errors.size() gt 0}">
                <div class="ui error message" style="display: block;">
                    <ol>
                        <c:forEach items="${errors}" var="err">
                            <li>${err}</li>
                        </c:forEach>
                    </ol>
                </div>
            </c:if>

        </form>

        <div class="ui info message">
            Do not have an account? <a href="${pageContext.request.contextPath}/user/add">Register</a>
        </div>
    </div>
</div>
</body>
</html>