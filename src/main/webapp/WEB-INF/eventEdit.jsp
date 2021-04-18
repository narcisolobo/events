<%@ page isErrorPage="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                <div class="col-sm-12">
                    <form:form action="/events/${event.id}/edit" method="post" modelAttribute="event">
                        <input type="hidden" name="_method" value="PUT">
                        <form:hidden path="host" value="${user.id}" />
                        <div class="row">
                            <div class="mb-3 col-sm-12">
                                <h5 class="mt-3 mb-3 text-light">Edit your event.</h5>
                                <form:input class="form-control" path="name" />
                                <small><form:errors path="name" class="orange-text" /></small>
                            </div>
                        </div>
                        <div class="row">
                            <div class="mb-3 col-sm-12 col-md-12 col-lg-6">
                                <form:input class="form-control" path="date" type="date" />
                                <small><form:errors path="date" class="orange-text" /></small>
                            </div>
                            <div class="mb-3 col-sm-6 col-md-6 col-lg-4">
                                <form:input class="form-control" path="city" />
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
                                <input type="submit" class="btn teal text-light shadow" value="Edit Event" />
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </main>
</body>

</html>