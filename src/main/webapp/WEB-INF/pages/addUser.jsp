<%--
  Created by IntelliJ IDEA.
  User: Crina
  Date: 12/8/2025
  Time: 10:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="AddUser">
    <h1>Add User</h1>

    <form class="needs-validation" method="POST" action="${pageContext.request.contextPath}/AddUser">

        <div class="mb-3">
            <label for="username" class="form-label">Username</label>
            <input type="text" class="form-control" id="username" name="username" placeholder="" value="" required>
            <div class="invalid-feedback">
                Username is required.
            </div>
        </div>

        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" name="email" required>
            <div class="invalid-feedback">
                Email is required.
            </div>
        </div>

        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="" value="" required>
            <div class="invalid-feedback">
                Password is required.
            </div>
        </div>

        <div class="mb-3">
            <label for="user_groups">User Groups</label>
            <select class="form-select" id="user_groups" name="user_groups" multiple>
                <c:forEach var="user_group" items="${userGroups}" varStatus="status">
                    <option value="${user_group}">${user_group}</option>
                </c:forEach>
            </select>
        </div>

        <button type="submit" class="btn btn-primary">Save</button>
    </form>
</t:pageTemplate>
