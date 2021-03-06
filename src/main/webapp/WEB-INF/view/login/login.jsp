<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/view/template/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>产品运营数据统计后台</title>

    <!-- Bootstrap -->
    <link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="/css/style.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/dialogsdk.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/zTreeStyle.css"/>">
    <!-- The fav icon -->
    <link rel="shortcut icon" href="<c:url value="/img/favicon.ico"/>">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

    <script src="<c:url value="/lib/jquery-1.11.2.min.js"/>"></script>
    <script src="<c:url value="/lib/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/lib/jquery.ztree.all-3.5.min.js"/>"></script>
    <script src="<c:url value="/lib/jquery.validate.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/lib/additional-methods.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/lib/jquery-validate.bootstrap-tooltip.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/lib/jquery.validate.custom.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/lib/dialogsdk.js"/>"></script>
</head>

<body>
<div class="loginWrap">
    <div class="loginWrap-ctn">
        <form method="post" id="loginForm">
            <div class="loginWrap-box">
                <input class="login-ipt login-name" type="text" name="username" placeholder="用户名">
                <input class="login-ipt login-password" type="password" name="password" placeholder="密码">
                <div class="login-inner">
                    <div class="login-box">
                        <button type="submit" class="login-btn">登&nbsp;&nbsp;&nbsp;录</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    $().ready(function () {
        // validate login form on keyup and submit
        $("#loginForm").validate({
            rules: {
                username: {
                    required: true
                },
                password: {
                    required: true
                },
                code: {
                    required: true
                }
            },
            messages: {
                username: {
                    required: "请输入账号"
                },
                password: {
                    required: "请输入密码"
                },
                code: {
                    required: "请输入验证码"
                }
            }
        });
    });

    <c:if test="${msg!=null}">
    $.DialogSdk.Error({Width: 350, Height: 200, Title: "错误", Content: '${msg}'});
    </c:if>
</script>