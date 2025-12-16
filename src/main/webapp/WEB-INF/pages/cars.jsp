<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Cars">
    <h1>Cars</h1>
    <form method="POST" action="${pageContext.request.contextPath}/Cars">
        <c:if test="${pageContext.request.isUserInRole('WRITE_CARS')}">
            <!-- buton Add -->
            <a href="${pageContext.request.contextPath}/AddCar" class="btn btn-primary">Add</a>
        </c:if>

        <c:if test="${pageContext.request.isUserInRole('WRITE_CARS')}">
            <!-- buton Add -->
            <a href="${pageContext.request.contextPath}/AddCar" class="btn btn-primary">Delete</a>
        </c:if>

        <div class="container text-center">
    <c:forEach var="car" items="${Cars}">
        <div class="row">
            <div class="col">
                <c:if test="${pageContext.request.isUserInRole('WRITE_CARS')}">
                    <input type="checkbox" name="deleteIds" value="${car.id}" />
                </c:if>

            </div>
            <div class="col">
                    ${car.licensePlate}
            </div>

            <div class="col">
                    ${car.parkingSpot}
            </div>

            <div class="col">
                    ${car.ownerName}
            </div>
            <div class="col">
                <img src="${pageContext.request.contextPath}/CarPhotos?id=${car.id}"
                     width="48"
                     alt="car photo"/>
            </div>

            <c:if test="${pageContext.request.isUserInRole('WRITE_CARS')}">
                <div class="col">
                    <a class="btn btn-secondary"
                       href="${pageContext.request.contextPath}/AddCarPhoto?id=${car.id}">
                        Add photo
                    </a>
                </div>
            </c:if>




            <div class="col">
                <c:if test="${pageContext.request.isUserInRole('WRITE_CARS')}">
                    <!-- buton Add -->
                    <a href="${pageContext.request.contextPath}/AddCar" class="btn btn-primary">Edit</a>
                </c:if>

            </div>
        </div>
    </c:forEach>

    </div>

    </form>
    <h5>Free parking spots: ${numberOfFreeParkingSpots}</h5>
</t:pageTemplate>
