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

    <c:if test="${pageContext.request.isUserInRole('WRITE_USERS')}">
        <a href="${pageContext.request.contextPath}/AddUser"
           class="btn btn-primary mb-3">
            Add User
        </a>
    </c:if>

    <form method="POST"
          action="${pageContext.request.contextPath}/Users">

        <button type="submit" class="btn btn-secondary mb-3">
            Invoice
        </button>

        <div class="container text-center">
            <c:forEach var="u" items="${users}">
                <div class="row align-items-center">
                    <div class="col-1">
                        <input type="checkbox"
                               name="user_ids"
                               value="${u.id}">
                    </div>
                    <div class="col">${u.username}</div>
                    <div class="col">${u.email}</div>
                </div>
            </c:forEach>
        </div>

    </form>


<c:if test="${not empty invoices}">
    <h2>Invoices</h2>
    <c:forEach var="username" items="${invoices}" varStatus="status">
        ${status.index+1}, ${username}
        <br/>
    </c:forEach>
</c:if>



</t:pageTemplate>

