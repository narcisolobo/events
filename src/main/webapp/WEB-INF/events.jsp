<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/style.css">
    <title>Events</title>
</head>

<body class="blue-grey-dark">
    <nav class="navbar teal shadow">
        <div class="container">
            <a href="/events" class="navbar-brand text-light">EVENTS</a>
            <ul class="navbar-nav">
                <li class="navbar-item"><a class="text-light" href="/logout">LOGOUT ${fn:toUpperCase(user.firstName)}</a></li>
            </ul>
        </div>
    </nav>
    <main>
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <h5 class="mt-3 text-light">Here are some of the events in your state.</h5>
                    <table class="table table-striped table-hover text-light">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Date</th>
                                <th>City</th>
                                <th>Host</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${events}" var="event">
                            <c:choose>
                            <c:when test="${event.state == user.state}">
                                <tr class="text-light">
                                    <td><a class="teal-text" href="/events/${event.id}">${event.name}</a></td>
                                    <td>
                                        <fmt:formatDate value="${event.date}" type="date" pattern="MMMM d, yyyy"/>
                                    </td>
                                    <td>${event.city}</td>
                                    <td>${event.host.firstName}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${event.host == user}">
                                                <a class="btn teal btn-sm text-light" href="/events/${event.id}/edit">Edit</a>
                                                <form class="d-inline" action="/events/${event.id}/delete" method="post">
                                                    <input type="hidden" name="_method" value="delete">
                                                    <button type="submit" class="btn red btn-sm text-light">Delete</button>
                                                </form>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach items="${event.usersJoined}" var="attendee">
                                                    <c:if test="${attendee.id == user.id}">
                                                        <a class="btn bg-warning btn-sm" href="/events/${event.id}/leave">Cancel</a>
                                                    </c:if>
                                                    <c:if test="${attendee.id != user.id}">
                                                        <a class="btn bg-warning btn-sm" href="/events/${event.id}/join">Join</a>
                                                    </c:if>
                                                </c:forEach>
                                                <c:if test="${event.usersJoined.size() == 0}">
                                                    <a class="btn bg-warning btn-sm" href="/events/${event.id}/join">Join</a>
                                                </c:if>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:when>
                            </c:choose>
                            </c:forEach>
                        </tbody>
                    </table>
                    <h5 class="mt-5 text-light">Here are some of the events in other states.</h5>
                    <table class="table table-striped table-hover text-light">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Date</th>
                                <th>City</th>
                                <th>State</th>
                                <th>Host</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${events}" var="event">
                            <c:choose>
                            <c:when test="${event.state != user.state}">
                                <tr class="text-light">
                                    <td><a class="teal-text" href="/events/${event.id}">${event.name}</a></td>
                                    <td>
                                        <fmt:formatDate value="${event.date}" type="date" pattern="MMMM d, yyyy"/>
                                    </td>
                                    <td>${event.city}</td>
                                    <td>${event.state}</td>
                                    <td>${event.host.firstName}</td>
                                    <td>
                                        <c:forEach items="${event.usersJoined}" var="attendee">
                                            <c:if test="${attendee.id == user.id}">
                                                <a class="btn bg-warning btn-sm" href="/events/${event.id}/leave">Cancel</a>
                                            </c:if>
                                            <c:if test="${attendee.id != user.id}">
                                                <a class="btn bg-warning btn-sm" href="/events/${event.id}/join">Join</a>
                                            </c:if>
                                        </c:forEach>
                                        <c:if test="${event.usersJoined.size() == 0}">
                                            <a class="btn bg-warning btn-sm" href="/events/${event.id}/join">Join</a>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:when>
                            </c:choose>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <section>
                <form:form action="/events/new" method="post" modelAttribute="event">
                    <form:hidden path="host" value="${user.id}" />
                    <div class="row">
                        <div class="mb-3 col-sm-12">
                            <h5 class="mt-3 text-light">Add a new event.</h5>
                            <form:input placeholder="Event Name" class="form-control" path="name" />
                            <small><form:errors path="name" class="orange-text" /></small>
                        </div>
                    </div>
                    <div class="row">
                        <div class="mb-3 col-sm-12 col-md-12 col-lg-6">
                            <form:input placeholder="Date" class="form-control" path="date" type="date" />
                            <small><form:errors path="date" class="orange-text" /></small>
                        </div>
                        <div class="mb-3 col-sm-6 col-md-6 col-lg-4">
                            <form:input placeholder="City" class="form-control" path="city" />
                            <small><form:errors path="city" class="orange-text" /></small>
                        </div>
                        <div class="mb-3 col-sm-6 col-md-6 col-lg-2">
                            <form:select class="form-select" path="state">
                                <option value="AL">Alabama</option>
                                <option value="AK">Alaska</option>
                                <option value="AZ">Arizona</option>
                                <option value="AR">Arkansas</option>
                                <option value="CA">California</option>
                                <option value="CO">Colorado</option>
                                <option value="CT">Connecticut</option>
                                <option value="DE">Delaware</option>
                                <option value="DC">District Of Columbia</option>
                                <option value="FL">Florida</option>
                                <option value="GA">Georgia</option>
                                <option value="HI">Hawaii</option>
                                <option value="ID">Idaho</option>
                                <option value="IL">Illinois</option>
                                <option value="IN">Indiana</option>
                                <option value="IA">Iowa</option>
                                <option value="KS">Kansas</option>
                                <option value="KY">Kentucky</option>
                                <option value="LA">Louisiana</option>
                                <option value="ME">Maine</option>
                                <option value="MD">Maryland</option>
                                <option value="MA">Massachusetts</option>
                                <option value="MI">Michigan</option>
                                <option value="MN">Minnesota</option>
                                <option value="MS">Mississippi</option>
                                <option value="MO">Missouri</option>
                                <option value="MT">Montana</option>
                                <option value="NE">Nebraska</option>
                                <option value="NV">Nevada</option>
                                <option value="NH">New Hampshire</option>
                                <option value="NJ">New Jersey</option>
                                <option value="NM">New Mexico</option>
                                <option value="NY">New York</option>
                                <option value="NC">North Carolina</option>
                                <option value="ND">North Dakota</option>
                                <option value="OH">Ohio</option>
                                <option value="OK">Oklahoma</option>
                                <option value="OR">Oregon</option>
                                <option value="PA">Pennsylvania</option>
                                <option value="RI">Rhode Island</option>
                                <option value="SC">South Carolina</option>
                                <option value="SD">South Dakota</option>
                                <option value="TN">Tennessee</option>
                                <option value="TX">Texas</option>
                                <option value="UT">Utah</option>
                                <option value="VT">Vermont</option>
                                <option value="VA">Virginia</option>
                                <option value="WA">Washington</option>
                                <option value="WV">West Virginia</option>
                                <option value="WI">Wisconsin</option>
                                <option value="WY">Wyoming</option>
                            </form:select>
                            <small><form:errors path="state" class="orange-text" /></small>
                        </div>
                        <div class="mb-3 d-flex justify-content-end">
                            <button type="submit" class="btn teal text-light shadow">Add Event</button>
                        </div>
                    </div>
                </form:form>
            </section>
        </div>
    </main>
</body>

</html>