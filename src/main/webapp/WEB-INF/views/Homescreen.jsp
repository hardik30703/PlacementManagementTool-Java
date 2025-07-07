<!DOCTYPE html>
<html>
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
        background-color: #333; /* Dark gray navigation bar */
        padding: 20px;
    }

    .navbar-brand {
        font-size: 22px;
        font-weight: bold;
        color: white;
    }

    main {
        padding: 20px;
    }

    .info-section {
        margin-bottom: 40px;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        background-color: #fff; /* White background for info sections */
    }

    .info-section h2 {
        font-size: 2em;
        margin-bottom: 15px;
        color: #4CAF50; /* Green headings */
    }

    .info-section p {
        font-size: 16px;
        line-height: 1.5;
        color: blue; /* Dark gray text */
    }

    li {
        color: #000000;
    }

</style>
<body>
<header>
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
                        <a class="nav-link" href="/StudentLogin">STUDENT LOGIN</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/TutorLogin">PLACEMENT TUTOR LOGIN</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/ProviderLogin">PROVIDER LOGIN</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<main>
    <section class="info-section">
        <h2>Students: Seamlessly Navigate Your Placement Journey</h2>
        <p>Our platform empowers students to efficiently manage their placement applications and track progress. Key features include:</p>
        <ul>
            <li><strong>Explore Placement Opportunities:</strong> Browse and apply for available roles that align with your career aspirations.</li>
            <li><strong>Submit Placement Acceptance Forms:</strong> After securing an offer, complete the necessary documentation to confirm your placement.</li>
            <li><strong>Track Application Progress:</strong> Stay informed about your placement status with real-time updates on your submission.</li>
        </ul>
    </section>

    <section class="info-section">
        <h2>Tutors: Oversee and Optimize Placement Processes</h2>
        <p>Tutors play a critical role in ensuring the integrity and efficiency of placement management. Their key functions include:</p>
        <ul>
            <li><strong>Review Student and Provider Forms:</strong> Validate submissions and resolve discrepancies before finalizing tutor approval.</li>
            <li><strong>Identify Form Discrepancies:</strong> Compare student and provider forms, flag inconsistencies, and initiate email reviews for further clarification.</li>
            <li><strong>Visualize Student Placements on a Map:</strong> Access an interactive map to see student locations for better placement oversight.</li>
            <li><strong>Schedule Site Visits & Manage Calendar Events:</strong> Plan placement visits, track schedules, and maintain an organized placement timeline.</li>
            <li><strong>Create Online Meetings Directly from the Calendar:</strong> Set up virtual meetings instead of site visits if timing don't meet up.</li>
            <li><strong>Access Route Guidance for Visits:</strong> Get optimized navigation routes for scheduled placement visits using integrated mapping tools.</li>
        </ul>
    </section>
</main>
</body>
</html>
