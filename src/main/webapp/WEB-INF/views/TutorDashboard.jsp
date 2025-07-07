<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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

    .info-section h2 {
        font-size: 35px;
        margin-bottom: 15px;
        color: #4CAF50; /* Green headings */
    }

    .info-section h3 {
        font-size: 28px;
        margin-bottom: 15px;
        color: #4CAF50; /* Green headings */
    }

    .info-section p {
        font-size: 16px;
        line-height: 1.5;
        color: blue; /* Dark gray text */
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
                        <a class="nav-link" href="/ScheduleSiteVisit">SCHEDULE SITE VISIT</a>
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
        <h2>Welcome to the Tutor Dashboard!</h2>

        <h3>Tutor Features</h3>
        <ul>
            <li>Submit a tutor form</li>
            <li>View and manage assigned student placement applications</li>
            <li>Schedule and oversee site visits</li>
            <li>Host and participate in online meetings</li>
            <li>Set available time slots for placement visits</li>
            <li>Communicate with students and providers</li>
            <li>Review discrepancies between student-provider forms</li>
            <li>Receive notifications on placement updates</li>
        </ul>
    </section>
</main>
</body>
</html>