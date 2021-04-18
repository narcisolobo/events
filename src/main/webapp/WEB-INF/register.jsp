<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/style.css">
    <title>Register</title>
</head>

<body class="flexed vh-100 blue-grey-darker">
    <div class="card blue-grey-dark w-24 shadow">
        <div class="card-body">
            <h2 class="card-title text-light">REGISTER</h2>
            <form:form action="/register" method="post" modelAttribute="user">
                <div class="mb-3">
                    <form:input placeholder="First Name" class="form-control" path="firstName" />
                    <small><form:errors path="firstName" class="orange-text" /></small>
                </div>
                <div class="mb-3">
                    <form:input placeholder="Last Name" class="form-control" path="lastName" />
                    <small><form:errors path="lastName" class="orange-text" /></small>
                </div>
                <div class="mb-3">
                    <form:input placeholder="Email Address" class="form-control" path="email" type="email" />
                    <small><form:errors path="email" class="orange-text" /></small>
                </div>
                <div class="mb-3">
                    <form:input placeholder="City" class="form-control" path="city" />
                    <small><form:errors path="city" class="orange-text" /></small>
                </div>
                <div class="mb-3">
                    <form:select class="form-select" path="state">
                        <form:option value="AL" label="Alabama" />
                        <form:option value="AK" label="Alaska" />
                        <form:option value="AZ" label="Arizona" />
                        <form:option value="AR" label="Arkansas" />
                        <form:option value="CA" label="California" />
                        <form:option value="CO" label="Colorado" />
                        <form:option value="CT" label="Connecticut" />
                        <form:option value="DE" label="Delaware" />
                        <form:option value="DC" label="District Of Columbia" />
                        <form:option value="FL" label="Florida" />
                        <form:option value="GA" label="Georgia" />
                        <form:option value="HI" label="Hawaii" />
                        <form:option value="ID" label="Idaho" />
                        <form:option value="IL" label="Illinois" />
                        <form:option value="IN" label="Indiana" />
                        <form:option value="IA" label="Iowa" />
                        <form:option value="KS" label="Kansas" />
                        <form:option value="KY" label="Kentucky" />
                        <form:option value="LA" label="Louisiana" />
                        <form:option value="ME" label="Maine" />
                        <form:option value="MD" label="Maryland" />
                        <form:option value="MA" label="Massachusetts" />
                        <form:option value="MI" label="Michigan" />
                        <form:option value="MN" label="Minnesota" />
                        <form:option value="MS" label="Mississippi" />
                        <form:option value="MO" label="Missouri" />
                        <form:option value="MT" label="Montana" />
                        <form:option value="NE" label="Nebraska" />
                        <form:option value="NV" label="Nevada" />
                        <form:option value="NH" label="New Hampshire" />
                        <form:option value="NJ" label="New Jersey" />
                        <form:option value="NM" label="New Mexico" />
                        <form:option value="NY" label="New York" />
                        <form:option value="NC" label="North Carolina" />
                        <form:option value="ND" label="North Dakota" />
                        <form:option value="OH" label="Ohio" />
                        <form:option value="OK" label="Oklahoma" />
                        <form:option value="OR" label="Oregon" />
                        <form:option value="PA" label="Pennsylvania" />
                        <form:option value="RI" label="Rhode Island" />
                        <form:option value="SC" label="South Carolina" />
                        <form:option value="SD" label="South Dakota" />
                        <form:option value="TN" label="Tennessee" />
                        <form:option value="TX" label="Texas" />
                        <form:option value="UT" label="Utah" />
                        <form:option value="VT" label="Vermont" />
                        <form:option value="VA" label="Virginia" />
                        <form:option value="WA" label="Washington" />
                        <form:option value="WV" label="West Virginia" />
                        <form:option value="WI" label="Wisconsin" />
                        <form:option value="WY" label="Wyoming" />
                    </form:select>
                    <small><form:errors path="state" class="orange-text" /></small>
                </div>
                <div class="mb-3">
                    <form:input placeholder="Password" class="form-control" path="password" type="password" />
                    <small><form:errors path="password" class="orange-text" /></small>
                </div>
                <div class="mb-3">
                    <form:input placeholder="Confirm Password" class="form-control" path="passwordConfirm" type="password" />
                    <small><form:errors path="passwordConfirm" class="orange-text" /></small>
                </div>
                <div class="flexed">
                    <button type="submit" class="btn teal flex-grow text-light shadow">REGISTER</button>
                </div>
            </form:form>
        </div>
        <div class="card-link text-center">
            <p><a class="teal-text" href="/login">Click here to login.</a></p>
        </div>
    </div>
</html>