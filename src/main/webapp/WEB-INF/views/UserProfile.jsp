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

    .info-section h2 {
        font-size: 35px;
        margin-bottom: 15px;
        color: #4CAF50; /* Green headings */
    }

    .info-section h3 {
        font-size: 28px;
        margin-bottom: 15px;
        color: #0048ff;
    }

    .info-section p {
        font-size: 16px;
        line-height: 1.5;
        color: blue; /* Dark gray text */
    }

    .profile-picture {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        object-fit: cover;
    }

    .edit-mode input {
        border: 1px solid #ced4da;
    }
</style>
</head>
<body>
<header class="bg-dark text-white">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="/StudentDashboard">Placement Management Tool</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="/StudentForm">STUDENT FORM</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/StudentTimeline">SEE STATUS</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/StudentViewAvailability">SEE TUTOR AVAILABILITY</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="https://www.ratemyplacement.co.uk/" target="_blank">SEARCH PLACEMENT ROLES</a>
                    </li>
                </ul>
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="/profile_picture.jpg" alt="User Profile" class="profile-picture">
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="/UserProfile">View Profile</a></li>
                            <li><a class="dropdown-item" href="/">Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<div class="container mt-4">
    <h2>User Profile</h2>
    <div class="card mb-4">
        <div class="card-body">
            <p><strong>Username:</strong> ${student.username}</p>
            <form id="profileForm" action="/UpdateProfile" method="post">
                <div class="mb-3">
                    <label for="firstname" class="form-label">First Name</label>
                    <input type="text" class="form-control" id="firstname" name="firstname" value="${student.firstname}" disabled required>
                </div>
                <div class="mb-3">
                    <label for="lastname" class="form-label">Last Name</label>
                    <input type="text" class="form-control" id="lastname" name="lastname" value="${student.lastname}" disabled required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" value="${student.email}" disabled required>
                </div>
                <button type="button" class="btn btn-secondary" id="editButton" onclick="enableEditing()">Edit</button>
                <button type="button" class="btn btn-danger d-none" id="cancelButton" onclick="cancelEditing()">Cancel</button>
                <button type="submit" class="btn btn-primary d-none" id="updateButton">Update</button>
            </form>
        </div>
    </div>

    <c:if test="${not empty successMessage}">
        <div class="alert alert-success mt-3">
                ${successMessage}
        </div>
    </c:if>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>
    const originalValues = {};

    function enableEditing() {
        const fields = ['firstname', 'lastname', 'email'];
        fields.forEach(field => {
            const input = document.getElementById(field);
            originalValues[field] = input.value;
            input.disabled = false;
        });

        document.getElementById('editButton').classList.add('d-none');
        document.getElementById('cancelButton').classList.remove('d-none');
        document.getElementById('updateButton').classList.remove('d-none');
    }

    function cancelEditing() {
        const fields = ['firstname', 'lastname', 'email'];
        fields.forEach(field => {
            const input = document.getElementById(field);
            input.value = originalValues[field];
            input.disabled = true;
        });

        document.getElementById('editButton').classList.remove('d-none');
        document.getElementById('cancelButton').classList.add('d-none');
        document.getElementById('updateButton').classList.add('d-none');
    }
</script>
</body>
</html>
