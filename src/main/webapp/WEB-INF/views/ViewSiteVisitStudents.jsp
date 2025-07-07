<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Placement Management Tool</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f0f8ff; /* Light blue background */
    }

    nav {
        padding: 20px;
    }

    main {
        padding: 20px;
    }

    .navbar-brand {
        font-size: 22px;
        font-weight: bold;
    }

    .nav-link {
        font-size: 16px;
    }

    h2 {
        color: #343a40;
    }

    p {
        color: #6c757d;
    }

    .info-section {
        margin-bottom: 40px;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        background-color: #fff; /* White background for info sections */
    }
</style>
<body>
<header class="bg-dark text-white">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="/TutorDashboard">Placement Management Tool</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="/ViewStudents">VIEW ALL STUDENTS</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/ScheduleSiteVisit">SITE VISIT SCHEDULE</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/viewStudentsMap">SEE STUDENTS IN PLACEMENT LOCATION</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/">LOGOUT</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<main>
    <section class="info-section">
        <h2><b>Cities with Students and Providers</b></h2><br>

        <form action="/ScheduleSiteVisit" method="get" class="mb-3">
            <div class="input-group">
                <input type="text" class="form-control" id="city" name="city" placeholder="Enter city" list="cities">
                <datalist id="cities"></datalist>
                <button type="submit" class="btn btn-primary">Search</button>
            </div>
        </form>

        <table class="table table-bordered">
            <thead>
            <tr>
                <th>City</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${cities}" var="city">
                <tr>
                    <td>${city}</td>
                    <td>
                        <form action="/ScheduleSiteVisitForm" method="get">
                            <input type="hidden" name="city" value="${city}">
                            <button type="submit" class="btn btn-primary">Schedule Visit</button>
                        </form>
                    </td>
                    <td>
                        <form action="/ViewAvailability" method="get">
                            <input type="hidden" name="city" value="${city}">
                            <button type="submit" class="btn btn-secondary">View Availability</button>
                        </form>
                    </td>
                    <td>
                        <form action="/GenerateSchedule" method="get">
                            <input type="hidden" name="city" value="${city}">
                            <button type="submit" class="btn btn-info">View Schedule</button>
                        </form>
                    </td>
                    <td>
                        <form action="/ViewRoute" method="get">
                            <input type="hidden" name="city" value="${city}">
                            <label for="date">Select Date:</label>
                            <select name="date" id="date" class="form-select">
                                <c:forEach items="${datesByCity[city]}" var="date">
                                    <option value="${date}">${date}</option>
                                </c:forEach>
                            </select>
                            <button type="submit" class="btn btn-success mt-2">View Route</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <a href="/CalendarView" class="btn btn-primary">Go to Calendar View</a>
    </section>
</main>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function(){
        $('#city').on('input', function() {
            var input = $(this).val();
            if(input.length > 0) {
                $.get('/SearchCity?city=' + input, function(data) {
                    var options = '';
                    for(var i=0; i<data.length; i++) {
                        options += '<option value="' + data[i] + '">';
                    }
                    $('#cities').html(options);
                });
            }
        });
    });
</script>
</body>
</html>
