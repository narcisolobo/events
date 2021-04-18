<%@ page isErrorPage="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
        rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
        crossorigin="anonymous">
    <link rel="stylesheet" href="/css/style.css">
    <title>Events</title>
</head>

<body class="blue-grey-dark">
    <nav class="navbar teal shadow">
        <div class="container">
            <a href="/events" class="navbar-brand text-light">EVENTS</a>
            <ul class="navbar-nav">
                <li class="navbar-item">
                    <a class="text-light" href="/logout">LOGOUT ${fn:toUpperCase(user.firstName)}</a>
                </li>
            </ul>
        </div>
    </nav>
    <main>
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-6">
                    <h2 class="mt-3 text-light">${event.name}</h2>
                    <span class="badge bg-warning text-dark">
                        Host: ${event.host.firstName} ${event.host.lastName}
                    </span>
                    <span class="badge bg-info text-dark">
                        Date:
                        <fmt:formatDate value="${event.date}" type="date" pattern="MMMM d, yyyy"/>
                    </span>
                    <span class="badge bg-info text-dark">
                        Location: ${event.city} ${event.state}
                    </span>
                    <span class="badge bg-info text-dark">
                        Attendees: ${fn:length(event.usersJoined)}
                    </span>
                    <h3 class="text-light mt-5">Attendees:</h3>
                    <table class="table table-striped text-light">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Location</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${event.usersJoined}" var="user">
                                <tr>
                                    <td class="text-light">${user.firstName} ${user.lastName}</td>
                                    <td class="text-light">${user.city}, ${user.state}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="col-sm-12 col-md-12 col-lg-6">
                    <h3 class="text-light mt-3">Message Wall:</h3>
                    <div class="comments p-3 rounded">
                        <c:forEach items="${event.comments}" var="comment">
                        <p class="blue-grey-text d-flex justify-content-between">${comment.content}<span class="badge bg-info text-dark">- ${comment.user.firstName}</span></p>
                        <hr>
                        </c:forEach>
                    </div>
                    <form:form action="/comments/${event.id}/new" method="post" modelAttribute="comment" class="mt-3">
                        <h4 class="text-light">Add Comment:</h4>
                        <input type="hidden" path="event" value="${event.id}">
                        <input type="hidden" path="user" value="${user.id}">
                        <div class="mb-3">
                            <form:textarea class="form-control" path="content"></form:textarea>
                            <small><form:errors path="content" class="orange-text"></form:errors></small>
                        </div>
                        <div class="d-flex justify-content-end">
                            <input type="submit" class="btn teal shadow text-light" value="Add Comment" />
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </main>
</body>

</html>