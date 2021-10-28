<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test title here</title>
</head>
<body>
	<h1>Hello Jeff</h1>
	<c:forEach items="${nkt_list}" var="nkt">
		${nkt}
	</c:forEach>
</body>
</html>