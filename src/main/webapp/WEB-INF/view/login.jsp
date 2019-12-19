<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <c:set var="ctx" value="<%=request.getContextPath()%>" scope="application"/>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/css/login.css">

</head>
<body>




    <div class="container">
        <a href="#" id="back" class="hidden-xs hidden-sm">
            <span class="glyphicon glyphicon-remove-circle"></span>
        </a>
        <div class="row">
            <div class="picDiv col-md-8 hidden-xs hidden-sm">
                <img src="${ctx}/img/bg/bg.png" class="">
            </div>
            <div class="formDiv col-md-4">
                <h1>Pixablog</h1>
                <form action="${ctx}/user/loginAuth.do">
                    <input type="text" placeholder="登录名" class="form-control" name="loginName">
                    <input type="password " placeholder="输入密码" class="form-control" name="password">
                    <input type="checkbox" id="ck" class="" name="remember"/> <label for="ck">7天免登录</label>
                    <input type="submit" value="登录" class="btn btn-primary clearfix">
                    <input type="reset" value="重置" class="btn btn-default clearfix">
                </form>
            </div>
        </div>
    </div>





</body>
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
</html>
