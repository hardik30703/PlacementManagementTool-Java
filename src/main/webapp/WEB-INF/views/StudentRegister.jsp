<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f0f8ff; /* Light blue background */
    }

    main {
        padding: 20px;
    }

    nav {
        background-color: #333; /* Dark gray navigation bar */
        padding: 20px;
    }

    .navbar-brand {
        font-size: 22px;
        font-weight: bold;
        color: white;
    }

    .nav-link {
        font-size: 16px;
    }

    h2 {
        font-size: 38px;
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

    footer {
        background-color: #222;
        color: #fff;
        padding: 20px;
        position: fixed;
        bottom: 0;
        left: 0;
        right: 0;
    }

    .status-bar {
        width: 100%;
        height: 10px;
        background-color: #ddd;
        margin-top: 10px;
        position: relative;
    }

    #status-indicator {
        height: 100%;
        width: 100%;
        background-color: grey;  /* Initial color */
        transition: width 0.3s ease, background-color 0.3s ease; /* Smooth transition */
        display: block;  /* Ensure the div takes space */
    }
</style>
<body>
<header class="bg-dark text-white">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">Placement Management Tool</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="/">HOME</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<div class="container mt-4">
    <section class="info-section">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2 class="mb-4"><b>Student Register</b></h2>
                <form action="/StudentRegister" method="post">
                    <div class="mb-3">
                        <label> Username </label>
                        <input type="text" class="form-control" id="username" name="username" required><br>
                        <label> Password </label>
                        <input type="password" class="form-control" id="password" name="password" oninput="checkPasswordStrength()" required><br>
                        <div class="status-bar">
                            <div id="status-indicator"></div>
                        </div>
                        <p id="feedback"></p>
                        <label> Firstname </label>
                        <input type="text" class="form-control" id="firstname" name="firstname" required><br>
                        <label> Lastname </label>
                        <input type="text" class="form-control" id="lastname" name="lastname" required><br>
                        <label> Email address </label>
                        <input type="email" class="form-control" id="email" name="email" required><br>
                    </div>
                    <input type="submit" class="btn btn-primary" id="register" value="Register" disabled>
                    <br><br>
                    <p>Already have an account? <a href="/StudentLogin">Login here</a></p><br>
                </form>
                <br>
            </div>
        </div>
    </section>
</div>
<footer class="bg-dark text-white"></footer>
<script>
    function checkPasswordStrength() {
        const password = document.getElementById('password').value;
        const statusIndicator = document.getElementById('status-indicator');
        const feedback = document.getElementById('feedback');
        const registerButton = document.getElementById('register');

        let strength = 0;
        let requirements = [];

        // Check for 8 characters
        if (password.length >= 8) {
            strength += 33;
        } else {
            requirements.push('at least 8 characters');
        }

        // Check for 1 special character
        if (/[!£@#$%^&*(),.?":{}|<>]/.test(password)) {
            strength += 33;
        } else {
            requirements.push('at least 1 special character');
        }

        // Check for 1 number
        if (/\d/.test(password)) {
            strength += 34;  // Adjust to total 100
        } else {
            requirements.push('at least 1 number');
        }

        // Update status bar width dynamically
        statusIndicator.style.width = strength + '%';

        // Change color based on strength
        if (strength === 0) {
            statusIndicator.style.backgroundColor = 'grey';
        } else if (strength > 0 && strength <= 33) {
            statusIndicator.style.backgroundColor = 'orange';
        } else if (strength > 33 && strength <= 67) {
            statusIndicator.style.backgroundColor = 'yellow';
        } else if (strength > 67 && strength <= 100) {
            statusIndicator.style.backgroundColor = 'green';
        }

        // Update feedback text
        let feedbackText = 'Password must contain: ';
        if (requirements.length > 0) {
            feedbackText += requirements.join(', ');
            registerButton.disabled = true;  // Disable the register button
        } else {
            feedbackText = 'Password meets all requirements!';
            registerButton.disabled = false; // Enable the register button
        }

        feedback.innerHTML = feedbackText;
    }

    <c:if test="${not empty errorMessage}">
    alert('${errorMessage}');
    </c:if>
</script>
</body>
</html>
