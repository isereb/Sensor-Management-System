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
                <h1 class="ui header">Your sensors</h1>
                <a class="ui fluid icon green button" href="${pageContext.request.contextPath}/sensor/add">
                    <i class="ui plus icon"></i>
                    Add new sensor
                </a>
                <jsp:useBean id="mySensors" scope="request" type="java.util.Set"/>
                <c:choose>
                    <c:when test="${mySensors ne null}">
                        <c:forEach items="${mySensors}" var="sensor">
                            <div class="ui top attached header">
                                    ${sensor.address}
                            </div>
                            <div class="ui attached segment">
                                <canvas id="chartForSensor${sensor.id}"
                                        width="400" height="130"></canvas>
                                <script>



                                    var ctx = document.getElementById("chartForSensor${sensor.id}").getContext('2d');
                                    var sensor${sensor.id} = new Chart(ctx, {
                                        "type": "line",
                                        "data": {
                                            "labels":
                                                [<c:forEach
                                                items="${sensor.monitoring}"
                                                var="point">
                                                    <c:set var = "date"
                                                    value =
                                                    "${fn:substring(point.createdAt,
                                                    11, 19)}" />
                                                    "${date}",
                                                    </c:forEach>],
                                            "datasets":[{
                                                "label":"Sensor #${sensor.id}",
                                                "data": [<c:forEach items="${sensor.monitoring}" var="point">${point.value},</c:forEach>],
                                                "fill":false,
                                                //"borderColor":"rgb(202, 0, 0)",
                                                "lineTension":0.2}
                                            ]},
                                        "options":{}
                                    });
                                </script>
                            </div>
                            <div class="ui bottom attached warning message">
                                Still in development
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:when test="${mySensors ne null && mySensors.size() > 0}">
                        <div class="ui warning icon message">
                            <i class="warning icon"></i>
                            You do not have sensors! Go ahead and create some.
                        </div>
                    </c:when>
                </c:choose>
            </div>
        </div>
    </div>
</body>
</html>
