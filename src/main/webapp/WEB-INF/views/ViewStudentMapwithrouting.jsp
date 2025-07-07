<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Placement Management Tool</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css"
          integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ=="
          crossorigin=""/>
    <link rel="stylesheet" href="https://unpkg.com/leaflet-control-geocoder/dist/Control.Geocoder.css"/>
    <link rel="stylesheet" href="https://unpkg.com/leaflet-routing-machine@3.2.12/dist/leaflet-routing-machine.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js"
            integrity="sha512-gZwIG9x3wUXg2hdXF6+rVkLF/0Vi9U8D2Ntg4Ga5I5BZpVkVxlJWbSQtXPSiUTtC0TjtGOmxa1AJPuV0CPthew=="
            crossorigin=""></script>
    <script src="https://unpkg.com/leaflet-control-geocoder/dist/Control.Geocoder.js"></script>
    <script src="https://unpkg.com/leaflet-routing-machine@3.2.12/dist/leaflet-routing-machine.js"></script>
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
<main class="container"><br>
    <section class="info-section">
        <div id="map" style="width: 1050px; height: 500px"></div>
    </section>
</main>
<script>
    // Initialize the map
    const map = L.map('map');

    // Add OpenStreetMap tile layer
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '© <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);

    // Search feature
    L.Control.geocoder({
        defaultMarkGeocode: true,
        placeholder: 'Search for a place...',
        errorMessage: 'Nothing found.',
    }).on('markgeocode', function (e) {
        map.fitBounds(e.geocode.bbox);
    }).addTo(map);

    // Initialize a route control for routing
    const routeControl = L.Routing.control({
        waypoints: [],
        routeWhileDragging: false,
        show: true,
        createMarker: function () {
            return null;
        }
    }).addTo(map);

    // Function to dynamically update the route
    function updateRoute(waypoints) {
        routeControl.setWaypoints(waypoints);
    }

    // Fetch city and date from the current page context (e.g., submitted via form)
    const city = new URLSearchParams(window.location.search).get("city");
    const date = new URLSearchParams(window.location.search).get("date");

    // Fetch the scheduled students from the server
    async function fetchAndProcessStudents(city, date) {
        const students = await $.get('/getScheduledStudents', {city: city, date: date});
        console.log("Student Order:", students);

        const waypoints = [];

        //Process postcode requests sequentially to maintain correct order
        for (const student of students) {
            const postcode = student.postcode;
            const data = await $.get('https://api.postcodes.io/postcodes/' + postcode);
            if (data.status === 200) {
                const latLng = [data.result.latitude, data.result.longitude];

                // Add marker to the map for each student
                const marker = L.marker(latLng).addTo(map);
                marker.bindPopup(student.firstname + ' ' + student.lastname + '<br/>Provider: ' + student.nameoforganisation + '<br/>Postcode: ' +
                    postcode + '<br/>Start Time: ' + student.startTime + '<br/>End Time: ' + student.endTime);

                //Add marker location to waypoints in the correct order
                waypoints.push(L.latLng(latLng));
            }
        }

        //Update the route only after all waypoints are processed in sequence
        updateRoute(waypoints);
    }

    // Call the function to process students and update the route
    if (city && date) {
        fetchAndProcessStudents(city, date);
    }


    //Live location
    map.locate({
        setView: true,
        maxZoom: 13
    }).on('locationfound', function (e) {
        L.circleMarker(e.latlng, {radius: 10, color: "blue"}).addTo(map)
            .bindPopup("You are here!")
            .openPopup();
    }).on('locationerror', function () {
        alert("Could not detect your location.");
    });
</script>


</body>
</html>