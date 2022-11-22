<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>c:forEach 标签实例</title>
</head>
<body>
    <c:forEach var="i" begin="1" end="5">
        var output = "${i}"

        <p>
            Item <c:out value="${i}"/></p>
        </p>

        <p>Item${i} <c:out value="${i}"/></p>


        <p> Item{output} <c:out value="${output}"/></p>

    </c:forEach>
</body>
</html>









