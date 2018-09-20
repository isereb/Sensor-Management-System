<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>Instant Message</title>
</head>


<body>

<%@include file="header.jsp"%>
<div>
    <%@include file="sidebar.jsp"%>
</div>

<div style="padding-top: 15px;">
    <div style="margin-left:28%; clear: both;">

    </div>
    <div style="margin-top: 60px; margin-left: 260px;">
        <form action="/user/instantMessage" method="POST">
        <div class="fields">
            <div class="field">
                <label> <strong>From :</strong></label>
                <input name="from" type="text" placeholder="your email" style="margin-left:
                       37px;">
            </div>
            <div class="field" style="margin-top: 5px;">
                <label><strong>Password :</strong></label>
                <input name="password" type="password"
                       placeholder="your email's password" style="margin-left:
                       1px;">
            </div>
            <br>
            <div class="field">
                <label><strong>To :</strong></label>
                <input name="to" type="text" placeholder="recipient" style="margin-left:
                       58px;">
            </div>
            <div class="field" style="margin-top: 5px;">
                <label><strong>Subject :</strong></label>
                <input name="subject" type="text" placeholder="Subject" style="margin-left:
                       18px;">
            </div>
        </div>
    </div>
    <div style="margin-left:28%; clear: both;">
        <div class="ui form" style="margin-right: 22px; margin-left: 7px">
            <div class="field">
                <br>
                <label><strong>Text</strong></label>
                <br>
                <textarea name="body" style="width:600px;
                height:250px;"></textarea>
            </div>


    </div>
    <div style="margin-left:40%; margin-top:30px;">


            <button type = "submit" style="margin-top:10px;"> <strong> Send
            </strong></button>
        </form>
    </div>
    <br>

    <div>

    </div>
</div>

<script type="text/javascript">
    var n =  new Date();
    var y = n.getFullYear();
    var m = n.getMonth() + 1;
    var d = n.getDate();
    document.getElementById("date").innerHTML = m + "/" + d + "/" + y;

</script>
</body>
</html>
