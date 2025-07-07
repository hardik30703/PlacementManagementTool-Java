<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<main class="container"><br>
    <section class="info-section">
        <h2><b>View All Students</b></h2><br>

        <form id="searchForm" action="/ViewStudents" method="get">
            <input list="usernames" type="text" id="username" name="username" placeholder="Search by Username">
            <datalist id="usernames"></datalist>

            <!-- Filter Options -->
            <label for="formStatus">Form Status:</label>
            <select id="formStatus" name="formStatus">
                <option value="all">All</option>
                <option value="studentFormSubmitted">Student Form Submitted</option>
                <option value="studentAndProviderFormsSubmitted">Student and Provider Forms Submitted</option>
                <option value="decisionMade">Decision Made</option>
            </select>
            <button type="submit">Search</button>
        </form>

        <table class="table table-bordered">
            <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Username</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${students}" var="student">
                <tr>
                    <td>${student.firstname} ${student.lastname}</td>
                    <td>${student.email}</td>
                    <td>${student.username}</td>
                    <td>
                        <c:choose>
                            <c:when test="${student.studentForm != null && student.studentForm.isSubmitted()}">
                                <a href="/ViewStudentForm/${student.studentID}" class="btn btn-info">View Student Form</a>
                            </c:when>
                            <c:otherwise>
                                <a class="btn btn-info disabled">View Student Form</a>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${student.providerForm != null && student.providerForm.isSubmitted()}">
                                <a href="/ShowProviderForm/${student.studentID}" class="btn btn-info">View Provider Form</a>
                            </c:when>
                            <c:otherwise>
                                <a class="btn btn-info disabled">View Provider Form</a>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${student.providerForm != null && student.providerForm.isSubmitted() && student.studentForm != null && student.studentForm.isSubmitted()}">
                                <a href="/ShowTutorForm/${student.studentID}" class="btn btn-info">View Tutor Form</a>
                            </c:when>
                            <c:otherwise>
                                <a class="btn btn-info disabled">View Tutor Form</a>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${student.providerForm != null && student.providerForm.isSubmitted() && student.studentForm != null && student.studentForm.isSubmitted()}">
                                <a href="/ViewFlags/${student.studentID}" class="btn btn-warning">View Flags</a>
                            </c:when>
                            <c:otherwise>
                                <a class="btn btn-info disabled">View Flags</a>
                            </c:otherwise>
                        </c:choose>
                        <c:set var="emailBody" value="" />
                        <c:forEach var="entry" items="${discrepanciesMap[student.studentID]}">
                            <c:set var="emailBody" value="${emailBody}${entry.value}%0D%0A" />
                        </c:forEach>
                        <a href="mailto:${student.email},${student.providerForm.contactemail}?subject=Placement Application&body=Your placement request is on hold. Please provide the following information: %0D%0A${emailBody}" class="btn btn-primary">Create Email</a>
<%--                        <a href="/ProposeSiteVisit/${student.studentID}" class="btn btn-primary">Propose Site Visit</a>--%>
                        <c:if test="${student.rejectionCount >= 2}">
                            <form action="/blockStudent" method="post" style="display:inline;">
                                <input type="hidden" name="studentId" value="${student.studentID}">
                                <button type="submit" class="btn ${student.blocked ? 'btn-success' : 'btn-danger'}">
                                        ${student.blocked ? 'Unblock' : 'Block'}
                                </button>
                            </form>
                        </c:if>
                        <c:if test="${student.providerForm != null && student.providerForm.nameoforganisation != null}">
                            <a href="https://www.ratemyplacement.co.uk/search-companies?s=${student.providerForm.nameoforganisation}" target="_blank" class="btn btn-secondary">View Company Reviews</a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </section>
</main>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function(){
        $('#username').on('input', function() {
            var input = $(this).val();
            if(input.length > 0) {
                $.get('/SearchStudentUsernames?username=' + input, function(data) {
                    var options = '';
                    for(var i=0; i<data.length; i++) {
                        options += '<option value="' + data[i] + '">';
                    }
                    $('#usernames').html(options);
                });
            }
        });

        $('#searchForm').on('submit', function(event) {
            event.preventDefault();
            var input = $('#username').val();
            var formStatus = $('#formStatus').val();
            window.location.href = '/ViewStudents?username=' + input + '&formStatus=' + formStatus;
        });
    });
</script>
</body>
</html>
