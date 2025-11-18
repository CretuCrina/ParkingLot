<%--
  Created by IntelliJ IDEA.
  User: Crina
  Date: 11/18/2025
  Time: 10:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Users">
    <h1>Users</h1>

    <div class="container text-center">
        <c:forEach var="u" items="${Users}">
            <div class="row">
                <div class="col">${u.username}</div>
                <div class="col">${u.email}</div>
            </div>
        </c:forEach>
    </div>

</t:pageTemplate>

