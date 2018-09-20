<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>SMS | Profile </title>
    <link type="text/css" rel="stylesheet" href="https://semantic-ui.com/dist/semantic.min.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style/main.css" />
</head>
<body>
<div class="ui container">
    <div class="ui grid">
        <div class="four wide column">
            <c:import url="sidebar.jsp" />
        </div>
        <div class="twelve wide column">
            <h1 class="ui header">Your profile</h1>
            <jsp:useBean id="user" scope="session" type="beans.UserEntity" />
            <form class="ui form" method="post" action="${pageContext.request.contextPath}/user/update">
                <c:if test="${success != null && success == true}">
                    <div class="ui icon success message" style="display: inline-flex;">
                        <i class="checkmark icon"></i>
                        You successfully updated your profile.
                    </div>
                </c:if>
                <div class="ui field">
                    <label>Username</label>
                    <input name="username" type="text" value="${user.username}">
                </div>
                <div class="ui field">
                    <label>Email</label>
                    <input name="email" type="text" value="${user.email}">
                </div>
                <div class="ui field">
                    <label>Password</label>
                    <div class="two fields">
                        <div class="ui field">
                            <input name="password" type="password" placeholder="Password" required>
                        </div>
                        <div class="ui field">
                            <input type="password" placeholder="Repeat password">
                        </div>
                    </div>
                </div>
                <div class="ui field">
                    <label>Name</label>
                    <input name="name" type="text" value="${user.name}">
                </div>
                <div class="ui field">
                    <label>Phone</label>
                    <input name="phone" type="number" value="${user.phone}">
                </div>
                <input class="ui blue fluid button" type="submit" value="Update my profile">
                <c:if test="${errors ne null && errors.size() gt 0}">
                    <div class="ui error message" style="display:block;">
                        <ol>
                            <c:forEach items="${errors}" var="err">
                                <li>${err}</li>
                            </c:forEach>
                        </ol>
                    </div>
                </c:if>
            </form>
        </div>
    </div>
</div>
</body>
</html>
