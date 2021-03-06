<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/template/taglib.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>产品运营数据统计后台</title>
    <link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="/css/style.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/zTreeStyle.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/dialogsdk.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/jquery-ui.css"/>">
    <link rel="shortcut icon" href="<c:url value="/img/favicon.ico"/>">
    <!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="<c:url value="/lib/jquery-1.11.2.min.js"/>"></script>
    <script src="<c:url value="/lib/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/lib/jquery.ztree.all-3.5.min.js"/>"></script>
    <script src="<c:url value="/lib/jquery.validate.js"/>"></script>
    <script src="<c:url value="/lib/additional-methods.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/lib/jquery-validate.bootstrap-tooltip.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/lib/jquery.validate.custom.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/lib/My97DatePickerBeta/My97DatePicker/WdatePicker.js"/>"></script>
    <script src="<c:url value="/lib/dialogsdk.js"/>"></script>
    <script src="<c:url value="/lib/tools/tools.js"/>"></script>
    <script src="<c:url value="/lib/layer/layer.js"/>"></script>
<body>
<div class="wrap">
    <jsp:include page="../../template/header.jsp"/>
    <jsp:include page="../../template/menu.jsp"/>

    <div class="container-fluid content">
        <div class="row">
            <div id="content" class="col-lg-10 col-md-9">
                <div class="sdk-content">
                    <ul class="breadcrumb">
                        <li>您当前的位置：</li>
                        <tags:breadcrumb/>
                        <li>编辑信息</li>
                    </ul>
                </div>
                <!--body start-->
                <div class="panel-group" id="accordion" role="tablist"
                     aria-multiselectable="true">
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingOne">
                            <h4 class="panel-title" id="-collapsible-group-item-#1-">
                                <a data-toggle="collapse" data-parent="#accordion"
                                   href="#collapseOne" aria-expanded="true"
                                   aria-controls="collapseOne" class=""> 编辑信息 </a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in"
                             role="tabpanel" aria-labelledby="headingOne" aria-expanded="true">
                            <div class="panel-body">
                                <form id="form" name="form" class="form-horizontal"
                                      action="<c:url value="/admin/admin/modify.do"/> " method="post">
                                    <fieldset>
                                        <input type="hidden" name="id" value="${admin.id}">
                                        <input type="hidden" name="userId" value="${admin.userId}">
                                        <div class="form-group form-group-sm">
                                            <label class="control-label col-sm-2">用户名:</label>
                                            <div class="col-sm-3">
                                                <span class="form-span">${admin.username}</span>
                                            </div>
                                        </div>
                                        <div class="form-group form-group-sm">
                                            <label class="control-label col-sm-2" for="name"><em
                                                    class="red-star">*</em>姓名:</label>
                                            <div class="col-sm-3">
                                                <input class="form-control" name="name" type="text"
                                                       maxlength="20" id="name" value="${admin.name}"/>
                                            </div>
                                        </div>
                                        <div class="form-group form-group-sm">
                                            <label class="control-label col-sm-2" for="type">类型：</label>
                                            <div class="col-sm-3">
                                                <select class="form-control" name="type" id="type">
                                                    <c:forEach items="${typeMap}" var="item">
                                                        <option value="${item.key}"
                                                                <c:if test="${item.key==admin.type}">selected="selected" </c:if>>${item.value}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group form-group-sm">
                                            <label class="control-label col-sm-2" for="email">邮箱:</label>
                                            <div class="col-sm-3">
                                                <input class="form-control" name="email"
                                                       type="text" id="email" value="${admin.email}"/>
                                            </div>
                                        </div>
                                        <div class="form-group form-group-sm">
                                            <label class="control-label col-sm-2" for="tel">电话:</label>
                                            <div class="col-sm-3">
                                                <input class="form-control" name="tel" type="text" id="tel"
                                                       maxlength="15" value="${admin.tel}"/>
                                            </div>
                                        </div>
                                        <div class="form-group form-group-sm">
                                            <label class="control-label col-sm-2" for="jobNo">工号:</label>
                                            <div class="col-sm-3">
                                                <input class="form-control" name="jobNo" type="text"
                                                       maxlength="15" id="jobNo" value="${admin.jobNo}"/>
                                            </div>
                                        </div>
                                        <div class="form-group form-group-sm">
                                            <label class="control-label col-sm-2" for="channel">渠道:</label>
                                            <div class="col-sm-3">
                                                <input class="form-control" type="text" id="channel"
                                                       name="channel"
                                                       onclick="onShowCompanyTree();" readonly> <input
                                                    class="form-control" type="hidden" id="channelIds"
                                                    name="channelIds">
                                                <div id="menuContent" class="menuContent"
                                                     style="display: none; position: absolute;width:360px;border: 1px solid #ccc;left:15px;position: absolute; z-index: 10;">
                                                    <ul id="treeDemo" class="ztree"
                                                        style="margin-top: 0; width: 160px;width: 358px;background-color: white;"></ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group form-group-sm">
                                            <label class="control-label col-sm-2" for="channelName">渠道名称:</label>
                                            <div class="col-sm-3">
                                                <span id="channelName"></span>
                                            </div>
                                        </div>
                                        <div class="form-group form-group-sm">
                                            <label class="control-label col-sm-2" for="channelName">关联游戏:</label>
                                            <div class="col-sm-3">
                                                <span id="platformName"></span>
                                            </div>
                                        </div>
                                        <div class="form-group form-group-sm" style="display:none">
                                            <label class="control-label col-sm-2" for="locale">使用语言:</label>
                                            <div class="col-sm-3">
                                                <input class="form-control" name="locale" type="text"
                                                       maxlength="15" id="locale" value="${admin.locale}"/>
                                            </div>
                                        </div>
                                        <div class="form-group form-group-sm">
                                            <label class="control-label col-sm-2"></label>
                                            <div class="col-sm-3">
                                                <shiro:hasPermission name="admin_admin_edit">
                                                    <button type="submit" class="btn btn-primary">保存</button>
                                                </shiro:hasPermission>
                                                <button type="button" class="btn btn-primary" onclick="history.go(-1)">
                                                    返回
                                                </button>
                                            </div>
                                        </div>
                                    </fieldset>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--body end-->
        </div>
    </div>
    <hr>
</div>
</body>
</html>
<script type="text/javascript">
    $().ready(function () {
        $("#form").validate({
            rules: {
                name: {
                    required: true,
                    maxlength: 20
                },
                email: {
                    email: true,
                    maxlength: 50
                },
                tel: {
                    email: true,
                    maxlength: 15
                },
                jobNo: {
                    maxlength: 15
                }
            },
            messages: {
                email: {
                    email: "请输入正确的邮箱格式！"
                }
            }
        });
    });

    function onShowCompanyTree() {
        var compamyinput = $("#channel");
        $("#menuContent").css({top: compamyinput.outerHeight() + "px"}).slideDown("fast");
        $("body").bind("mousedown", onCompanyBodyDown);
    }

    function hideCompanyMenu() {
        $("#menuContent").fadeOut("fast");
        $("body").unbind("mousedown", onCompanyBodyDown);
    }

    function onCompanyBodyDown(event) {
        if (!(event.target.id == "channel" || $(event.target).parents("#menuContent").length > 0)) {
            hideCompanyMenu();
        }
    }
</script>
