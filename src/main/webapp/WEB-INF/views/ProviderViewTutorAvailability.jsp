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
            <a class="navbar-brand" href="/ProviderDashboard">Placement Management Tool</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="/ViewProviderStudents">VIEW ALL STUDENTS</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/ProviderViewAvailability">SEE TUTOR AVAILABILITY</a>
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
    <section class="container">
        <h2><b>Provider View Availability for ${city}</b></h2>
        <form action="/SubmitProviderAvailability" method="post" onsubmit="return showConfirmationPopup();">
            <input type="hidden" name="providerId" value="${providerId}">
            <input type="hidden" name="city" value="${city}">
            <c:forEach items="${slotsByDate}" var="entry">
                <h3>Date: ${entry.key}</h3>
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>Start Time</th>
                        <th>End Time</th>
                        <th>Select</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${entry.value}" var="slot">
                        <tr>
                            <td>${slot.startTime}</td>
                            <td>${slot.endTime}</td>
                            <td>
                                <input type="checkbox" name="selectedSlots" value="${slot.TTSId}">
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:forEach>
            <button type="submit" class="btn btn-primary">Submit Availability</button>
        </form>
        <br>
        <a href="mailto:${tutor.email}?subject=Site Visit Scheduling &body=Dear Tutor,%0A%0AI am unable to select any of the provided times and dates for a site visit. Please let me know if there are alternative options available. Here is my availability:%0A%0A[Your availability details]%0A%0AThank you%0A"
           class="btn btn-secondary"> Click here if you cant do any of these</a>
    </section>
</main>
<script>
    // Function to show confirmation popup
    function showConfirmationPopup() {
        alert("Your availability has been successfully submitted!");
        return true; // Ensure form submission continues after the popup
    }
</script>
</body>
</html>