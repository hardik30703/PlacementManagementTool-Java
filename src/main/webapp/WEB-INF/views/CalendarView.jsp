<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Placement Management Tool</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js"></script>
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
        <div id="calendar" style="width: 1100px; height: 400px"></div>
        <br>
    </section>
</main>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const calendarEl = document.getElementById('calendar');

        const calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'timeGridDay',
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay'
            },
            events: function (fetchInfo, successCallback, failureCallback) {
                // Fetch events from the first API
                $.get('/getScheduleForCalendar', function (calendarData) {
                    console.log("Fetched Events from Schedule API:", calendarData);

                    // Fetch events from the second API (OnlineMeetings)
                    $.get('/getOnlineMeetings', function (meetingsData) {
                        console.log("Fetched Events from OnlineMeetings API:", meetingsData);

                        // Combine events from both APIs
                        const combinedEvents = [...calendarData, ...meetingsData];

                        // Pass the combined events to FullCalendar
                        successCallback(combinedEvents);
                    }).fail(function (error) {
                        console.error("Error fetching online meetings:", error);
                        failureCallback(error);
                    });
                }).fail(function (error) {
                    console.error("Error fetching calendar events:", error);
                    failureCallback(error);
                });
            },
            dateClick: function (info) {
                const selectedStart = new Date(info.dateStr);// Capture the clicked time slot
                console.log("Time slot clicked:", selectedStart);

                // Format the date (YYYY-MM-DD)
                const formattedDate = selectedStart.toLocaleDateString(); // Formats to a human-readable date
                // Format the time (HH:mm)
                const hours = selectedStart.getHours();
                const minutes = selectedStart.getMinutes();
                var formattedTime = hours + ':' + (minutes < 10 ? '0' + minutes : minutes); // Add leading zero for minutes < 10


                // Step 1: Fetch students
                $.ajax({
                    url: '/getApprovedStudents',
                    method: 'GET',
                    success: function (students) {
                        console.log("Fetched students:", students);

                        if (!students || students.length === 0) {
                            Swal.fire('No Approved Students', 'No students are available for scheduling.', 'info');
                            return;
                        }

                        // Step 2: Build student dropdown options
                        let studentOptions = '';
                        students.forEach(function (s) {
                            studentOptions += '<option value="' + s.studentID + '">' + s.firstname + ' ' + s.lastname + '</option>';
                        });

                        // Check that studentOptions are generated correctly
                        console.log("Generated studentOptions:", studentOptions);

                        // Step 3: Show SweetAlert2 popup after loading students
                        Swal.fire({
                            title: 'Create a Meeting',
                            html: '<p><strong>Selected Date:</strong> ' + formattedDate + '</p>' +
                                '<p><strong>Selected Time:</strong> ' + formattedTime + '</p>' +
                                '<label for="studentSelect">Select Student:</label>' +
                                '<select id="studentSelect" style="width: 100%; padding: 5px;">' +
                                studentOptions +
                                '</select><br/><br/>' +
                                '<label for="meetingTitle">Meeting Title:</label>' +
                                '<input type="text" id="meetingTitle" placeholder="Enter meeting title" style="width: 100%; padding: 5px;">',
                            showCancelButton: true,
                            confirmButtonText: 'Save Meeting',
                            preConfirm: function () {
                                const meetingTitle = document.getElementById('meetingTitle').value;
                                const selectedStudentId = document.getElementById('studentSelect').value;

                                if (!meetingTitle || !selectedStudentId) {
                                    Swal.showValidationMessage('Please fill out all fields.');
                                    return false;  // Prevent form submission if fields are not filled
                                }

                                const selectedStudentName = $('#studentSelect option:selected').text();

                                return { meetingTitle, selectedStudentId, selectedStudentName };
                            }
                        }).then(function (result) {
                            if (result.isConfirmed) {
                                const meetingTitle = result.value.meetingTitle;
                                const selectedStudentId = result.value.selectedStudentId;
                                const selectedStudentName = result.value.selectedStudentName;

                                // Create a new event for the calendar
                                const newEvent = {
                                    title: meetingTitle + ' (Student Name: ' + selectedStudentName + ')',
                                    start: selectedStart,
                                    end: new Date(new Date(selectedStart).getTime() + 30 * 60000).toISOString(),
                                    extendedProps: {
                                        studentId: selectedStudentId,
                                        meetingType: "Online"
                                    }
                                };

                                // Send the new event to the backend
                                $.ajax({
                                    url: '/createMeeting',
                                    method: 'POST',
                                    contentType: 'application/json',
                                    data: JSON.stringify(newEvent),
                                    success: function (res) {
                                        Swal.fire('Success', 'Meeting has been scheduled!', 'success');
                                        calendar.addEvent(newEvent);  // Optionally add the event to the calendar if backend doesn't return it
                                    },
                                    error: function (err) {
                                        console.error("Error saving meeting:", err);
                                        Swal.fire('Error', 'Could not save meeting.', 'error');
                                    }
                                });
                            }
                        });
                    },
                    error: function (err) {
                        console.error("Error fetching students:", err);
                        Swal.fire('Error', 'Could not load students.', 'error');
                    }
                });
            },
            eventClick: function (info) {
                const meetingType = info.event.extendedProps.meetingType; // Get meeting type
                console.log("Meeting ID:", info.event.id);
                console.log("Clicked Event:", info.event);

                let swalOptions = {
                    title: 'Event Details',
                    html: '<p><strong>Title:</strong> ' + info.event.title + '</p>' +
                        '<p><strong>Start:</strong> ' + info.event.start + '</p>' +
                        '<p><strong>End:</strong> ' + info.event.end + '</p>',
                    confirmButtonText: 'Close'
                };

                // Only show the delete button if it's an online meeting
                if (meetingType === "Online") {
                    swalOptions.showDenyButton = true;
                    swalOptions.denyButtonText = 'Delete Meeting';
                }

                Swal.fire(swalOptions).then((result) => {
                    if (result.isDenied && meetingType === "Online") {
                        Swal.fire({
                            title: 'Are you sure?',
                            text: "You won't be able to recover this meeting!",
                            icon: 'warning',
                            showCancelButton: true,
                            confirmButtonText: 'Yes, delete it!',
                            cancelButtonText: 'Cancel'
                        }).then((confirmResult) => {
                            if (confirmResult.isConfirmed) {
                                $.ajax({
                                    url: '/deleteMeeting?meetingId=' + info.event.id, // Meeting ID passed in the URL
                                    method: 'DELETE',
                                    success: function () {
                                        Swal.fire('Deleted!', 'The meeting has been removed.', 'success');
                                        info.event.remove(); // Remove from calendar UI
                                    },
                                    error: function (err) {
                                        console.error("Error deleting meeting:", err);
                                        Swal.fire('Error', 'Could not delete meeting.', 'error');
                                    }
                                });
                            }
                        });
                    }
                });
            }

        });

        calendar.render();
    });
</script>



</body>
</html>