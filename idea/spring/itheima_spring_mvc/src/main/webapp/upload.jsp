<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文件上传</title>
</head>
<body>

<form action="${pageContext.request.contextPath}/user/quick23"
      method="post" enctype="multipart/form-data">
    name: <input type="text" name="username"> <br/>
    file1: <input type="file" name="files"> <br/>
    file2: <input type="file" name="files"> <br/>
    file3: <input type="file" name="files"> <br/>
    <input type="submit" value="提交"> <br/>
</form>


<form action="${pageContext.request.contextPath}/user/quick22"
      method="post" enctype="multipart/form-data">
    name: <input type="text" name="username"> <br/>
    file: <input type="file" name="file"> <br/>
    <input type="submit" value="提交"> <br/>
</form>
</body>
</html>
