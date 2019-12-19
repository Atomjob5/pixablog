<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
    <c:set var="ctx" value="<%=request.getContextPath()%>" scope="application"/>
    <jsp:forward page="/page/toIndex.do"></jsp:forward>
</body>
</html>
