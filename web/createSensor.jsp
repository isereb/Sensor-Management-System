<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <h1 class="ui header">Add a new sensor</h1>
            <form class="ui form" action="${pageContext.request.contextPath}/sensor/add" method="post">
                <div class="ui grid">
                    <div class="eight wide column">
                        <c:if test="${success != null && success == true}">
                            <div class="ui icon success message" style="display: inline-flex">
                                <i class="checkmark icon"></i>
                                <div class="content">
                                    <div class="header">
                                        You successfully added new sensor.
                                    </div>
                                    <p>Go back to <a href="${pageContext.request.contextPath}/">home page</a>.</p>
                                </div>
                            </div>
                        </c:if>
                        <div class="field">
                            <div class="ui left icon input">
                                <i class="building icon"></i>
                                <input type="text" name="address" placeholder="Address of the sensor">
                            </div>
                        </div>
                        <div class="field">
                            <div class="ui left icon input">
                                <i class="key icon"></i>
                                <input type="text" name="password" placeholder="Sensor pin">
                            </div>
                        </div>
                        <div class="field">
                            <div class="ui left icon input">
                                <i class="exclamation icon"></i>
                                <input type="number" name="max" placeholder="Maximum value">
                            </div>
                        </div>
                        <div class="field">
                            <div class="ui left icon input">
                                <i class="exclamation icon"></i>
                                <input type="number" name="min" placeholder="Maximum value">
                            </div>
                        </div>
                        <input type="submit" value="Add new sensor" class="ui fluid olive button">
                        <c:if test="${errors ne null && errors.size() gt 0}">
                            <div class="ui error message" style="display:block;">
                                <ol>
                                    <c:forEach items="${errors}" var="err">
                                        <li>${err}</li>
                                    </c:forEach>
                                </ol>
                            </div>
                        </c:if>
                    </div>
                    <div class="eight wide column">
                        <b>Address of the sensor</b> is used to differentiate sensors<br />
                        <b>Maximum value</b> is a value, that monitoring entry have to exceed in order for user to be
                        notified<br />
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
