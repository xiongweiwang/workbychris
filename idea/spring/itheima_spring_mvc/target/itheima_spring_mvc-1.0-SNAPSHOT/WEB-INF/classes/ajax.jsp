<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
    <script>
        $(document).ready(function () {
            var userList = [];
            userList.push({username: "Tom", age: 5});
            userList.push({username: "Jerry", age: 3});

            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/user/quick15",
                data: JSON.stringify(userList), // ✅ 修正 Json.stringify 为 JSON.stringify
                contentType: "application/json;charset=utf-8",
                success: function (response) {
                    console.log("✅ 请求成功: ", response);
                },
                error: function (xhr, status, error) {
                    console.error("❌ 请求失败: ", status, error);
                }
            });
        });
    </script>
</head>
<body>
</body>
</html>
