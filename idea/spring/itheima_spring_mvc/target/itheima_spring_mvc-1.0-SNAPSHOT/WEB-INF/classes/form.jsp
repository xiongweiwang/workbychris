<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/user/quick14" method="post">
    <input type="text" name="userList[0].username"> <br/>
    <input type="text" name="userList[0].age">  <br/>
    <input type="text" name="userList[1].username"> <br/>
    <input type="text" name="userList[1].age">  <br/>
    <input type="submit" value="submit"></input>
</form>

</body>
</html>
