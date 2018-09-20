<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> SMS | Registration</title>
    <link type="text/css" rel="stylesheet" href="https://semantic-ui.com/dist/semantic.min.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style/index.css" />
</head>

<body>
<div class="ui middle aligned center aligned grid">
    <div class="column">
        <h2 class="ui green image header">
            <div class="content">
                Registration
            </div>
        </h2>
        <c:if test="${success != null && success == true}">
            <div class="ui icon success message">
                <i class="checkmark icon"></i>
                You successfully registered.
                Please proceed to <a href="${pageContext.request.contextPath}/">login page</a>.
            </div>
        </c:if>
        <form class="ui large form" method="post" action="${pageContext.request.contextPath}/user/add">
            <div class="ui stacked segment">
                <div class="field">
                    <div class="ui left icon input">
                        <i class="user icon"></i>
                        <input type="text" name="username" placeholder="Username">
                    </div>
                </div>
                <div class="field">
                    <div class="ui left icon input">
                        <i class="envelope icon"></i>
                        <input type="text" name="email" placeholder="E-mail">
                    </div>
                </div>
                <div class="field">
                    <div class="ui left icon input">
                        <i class="lock icon"></i>
                        <input type="password" name="password" placeholder="Password">
                    </div>
                </div>
                <div class="field">
                    <div class="ui left icon input">
                        <i class="lock icon"></i>
                        <input type="password" name="password-again" placeholder="Password repeat">
                    </div>
                </div>
                <div class="field">
                    <div class="ui left icon input">
                        <i class="id card icon"></i>
                        <input type="text" name="name" placeholder="Full name">
                    </div>
                </div>
                <div class="field">
                    <div class="ui left icon input">
                        <i class="phone icon"></i>
                        <input type="number" name="phone" placeholder="Phone">
                    </div>
                </div>
                <input type="submit" class="ui fluid large green submit button" value="Register"/>
            </div>
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

        <div class="ui info message">
            Already have an account? <a href="${pageContext.request.contextPath}/user/login">Login</a>
        </div>
    </div>
</div>
</body>
</html>