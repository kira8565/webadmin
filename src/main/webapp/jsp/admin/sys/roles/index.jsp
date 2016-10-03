<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/include/taglib.jsp"%>
<%@include file="../../header.jsp"%>
<section class="content">
    <app:t_message></app:t_message>
    <div class="box box-info">
        <div class="box-header with-border">
            <h3 class="box-title">角色管理</h3>
        </div>
        <form class="form-horizontal">
            <div class="box-body">
                <app:searchinput defaultValue="${param.name}" labelName="角色名称" inputID="name"></app:searchinput>
            </div>
            <div class="box-footer">
                <sec:authorize access="hasAuthority('ROLE_SYS_ROLE_ADD')">
                    <app:addButton></app:addButton>
                </sec:authorize>
                <app:searchButton></app:searchButton>
            </div>
        </form>
    </div>
    <div class="box">
        <!-- /.box-header -->
        <div class="box-body table-responsive no-padding">
            <table class="table table-hover">
                <tbody>
                <tr>
                    <th style="width: 10%;">角色名称</th>
                    <th style="width: 10%;">角色备注</th>
                    <th style="width: 20%;">操作</th>
                </tr>
                <c:forEach var="vo" items="${result}">
                    <tr>
                        <td>${vo.name}</td>
                        <td>${vo.comment}</td>
                        <td>
                            <sec:authorize access="hasAuthority('ROLE_SYS_ROLE_EDIT')">
                                <app:editButton id="${vo.id}"></app:editButton>
                            </sec:authorize>

                            <sec:authorize access="hasAuthority('ROLE_SYS_ROLE_CONFIGUSER')">
                                <a href="configUser?id=${vo.id}" class="btn btn-success ">设置用户</a>
                            </sec:authorize>

                            <sec:authorize access="hasAuthority('ROLE_SYS_ROLE_CONFIGMENU')">
                                <a href="configMenu?id=${vo.id}" class="btn btn-primary ">菜单权限</a>
                            </sec:authorize>

                            <sec:authorize access="hasAuthority('ROLE_SYS_ROLE_DELETE')">
                                <app:deleteButton id="${vo.id}"></app:deleteButton>
                            </sec:authorize>
                        </td>
                    </tr>
                </c:forEach>
                </tr>
                </tbody>
            </table>
        </div>
        <%@include file="../common/pagenation.jsp" %>
    </div>

</section>
<%@include file="../../footer.jsp"%>