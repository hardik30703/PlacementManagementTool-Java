<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Placement Management Tool</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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

        .form-group {
            margin-bottom: 1rem;
        }

        .container {
            display: flex;
        }

        .form-container {
            flex: 1;
            margin-right: 20px;
        }

        .slots-container {
            flex: 1;
            margin-left: 20px;
            border-left: 1px solid #ddd;
            padding-left: 20px;
        }

        .slot-label {
            display: block;
            margin-bottom: 5px;
        }

        .message {
            color: green;
            font-weight: bold;
            margin-top: 20px;
        }
    </style>
</head>
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
    <section class="container">
        <div class="form-container">
            <h2><b>Submit Your Availability</b></h2>
            <form action="/submitAvailability" method="post">
                <div class="form-group">
                    <label for="date">Date:</label>
                    <input type="date" class="form-control" id="date" name="date" required>
                </div>
                <div class="form-group">
                    <label for="startTime">Start Time:</label>
                    <input type="time" class="form-control" id="startTime" name="startTime">
                </div>
                <div class="form-group">
                    <label for="endTime">End Time:</label>
                    <input type="time" class="form-control" id="endTime" name="endTime">
                </div>
                <input type="hidden" name="city" id="city" value="${city}">
                <button type="button" class="btn btn-secondary" id="addSlotButton">Add Slot</button>
                <br><br>
                <div style="display: none;" id="timeSlotsContainer"></div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
        <div class="slots-container">
            <h2>Added Slots</h2>
            <div id="slotsDisplayContainer"></div>
            <div id="cityContainer"><b>City:</b> <span id="cityDisplay">${city}</span></div>
        </div>
    </section>
</main>
<script>
    document.getElementById('addSlotButton').addEventListener('click', function () {
        let dateInput = document.getElementById('date');
        let startTimeInput = document.getElementById('startTime');
        let endTimeInput = document.getElementById('endTime');
        let timeSlotsContainer = document.getElementById('timeSlotsContainer');
        let slotsDisplayContainer = document.getElementById('slotsDisplayContainer');
        let cityValue = document.getElementById('city').value;

        console.log("Date Input:", dateInput.value);
        console.log("Start Time Input:", startTimeInput.value);
        console.log("End Time Input:", endTimeInput.value);
        console.log("City Value:", cityValue);

        // Check if both date, start time, and end time are selected
        if (dateInput.value && startTimeInput.value && endTimeInput.value) {
            // Disable the date input after the first selection
            dateInput.disabled = true;

            let startTime = new Date(`1970-01-01T` + startTimeInput.value);
            let endTime = new Date(`1970-01-01T` + endTimeInput.value);

            while (startTime < endTime) {
                let nextTime = new Date(startTime);
                nextTime.setMinutes(nextTime.getMinutes() + 30);
                let formattedEndTime = nextTime.toTimeString().slice(0, 5);

                console.log("Adding Slot - Date:", dateInput.value, "Start Time:", startTime.toTimeString().slice(0, 5), "End Time:", formattedEndTime);

                let slotDiv = document.createElement('div');
                slotDiv.className = 'form-group';

                let slotLabel = document.createElement('label');
                slotLabel.className = 'slot-label';
                slotLabel.innerHTML =
                    '<strong>Date:</strong> ' + dateInput.value +
                    ' <strong>Start Time:</strong> ' + startTime.toTimeString().slice(0, 5) +
                    ' <strong>End Time:</strong> ' + formattedEndTime;
                slotDiv.appendChild(slotLabel);

                timeSlotsContainer.appendChild(slotDiv);
                slotsDisplayContainer.appendChild(slotDiv.cloneNode(true)); // Display the slot on the right side

                let slotInputDate = document.createElement('input');
                slotInputDate.type = 'hidden';
                slotInputDate.name = 'timeSlots[' + timeSlotsContainer.childElementCount + '].date';
                slotInputDate.value = dateInput.value;
                slotDiv.appendChild(slotInputDate);

                let slotInputStartTime = document.createElement('input');
                slotInputStartTime.type = 'hidden';
                slotInputStartTime.name = 'timeSlots[' + timeSlotsContainer.childElementCount + '].startTime';
                slotInputStartTime.value = startTime.toTimeString().slice(0, 5);
                slotDiv.appendChild(slotInputStartTime);

                let slotInputEndTime = document.createElement('input');
                slotInputEndTime.type = 'hidden';
                slotInputEndTime.name = 'timeSlots[' + timeSlotsContainer.childElementCount + '].endTime';
                slotInputEndTime.value = formattedEndTime;
                slotDiv.appendChild(slotInputEndTime);

                let slotInputCity = document.createElement('input');
                slotInputCity.type = 'hidden';
                slotInputCity.name = 'timeSlots[' + timeSlotsContainer.childElementCount + '].city';
                slotInputCity.value = cityValue;
                slotDiv.appendChild(slotInputCity);

                startTime = nextTime;
            }

            startTimeInput.value = '';
            endTimeInput.value = '';
        } else {
            alert('Please select both date, start time, and end time.');
        }
    });
</script>
</body>
</html>
