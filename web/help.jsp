<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Help and FAQ</title>
</head>

<body>

<%@include file="header.jsp"%>
<div>
    <%@include file="sidebar.jsp"%>
</div>

<div style="padding-top: 15px;">

    <div style="margin-left:28%; clear: both;">
        <h2>What Privilages do I have ?</h2>
        <p>At the end of the HTML tutorial, you can find more than 200 examples.

            With our online editor, you can edit and test each example yourself.</p>
        <br>
        <h2>How to Add a User ?</h2>
        <p>At the end of the HTML tutorial, you can find more than 200 examples.

            With our online editor, you can edit and test each example yourself.</p>
        <br>
        <h2>How to View a Sensor ? </h2>
        <p>At the end of the HTML tutorial, you can find more than 200 examples.

            With our online editor, you can edit and test each example yourself.</p>
        <br>
        <h2>How to Add a Sensor ?</h2>
        <p>At the end of the HTML tutorial, you can find more than 200 examples.

            With our online editor, you can edit and test each example yourself.</p>
        <br>


    </div>
    <div style="margin-left:50%; margin-top:30px;">
        <button><img src="images/search.png" height="20px"
                     width="20px"></button>
        <input type="search" id="search" name="search"
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
