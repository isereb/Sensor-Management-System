<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<img id="logo" class="ui small rounded image" src="${pageContext.request.contextPath}/images/logo.PNG">
<div class="ui vertical menu">
    <div class="item">
        <div class="header">${user.name}</div>
        <div class="menu">
            <a class="item" href="${pageContext.request.contextPath}/main">Home</a>
            <a class="item" href="${pageContext.request.contextPath}/user/update">Profile</a>
            <a class="item" href="${pageContext.request.contextPath}/user/logout">Sign out</a>
        </div>
    </div>
    <div class="item">
        <div class="header">Admin</div>
        <div class="menu">
            <a class="item"
               href="${pageContext.request.contextPath}/user/view">View all users</a>
            <%--<a class="item">Profile</a>--%>
        </div>
    </div>
</div>