<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <h2><b>View Flags</b></h2><br>
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-6">
                        <h4>Student Form</h4>
                        <form>
                            <c:if test="${discrepancies.studentFullName != null}">
                                <div class="form-group">
                                    <label>Student Name:</label>
                                    <input type="text" class="form-control" value="${studentForm.firstname} ${studentForm.lastname}" style="color: red;" readonly>
                                    <button type="button" class="btn btn-success btn-sm" onclick="resolveFlag('studentFullName', ${student.studentID}, 'student')">Flag Resolved</button>
                                </div>
                            </c:if>
                            <c:if test="${discrepancies.addressofplacement != null}">
                                <div class="form-group">
                                    <label>Address of Placement:</label>
                                    <input type="text" class="form-control" value="${studentForm.addressofplacement}" style="color: red;" readonly>
                                    <button type="button" class="btn btn-success btn-sm" onclick="resolveFlag('addressofplacement', ${student.studentID}, 'student')">Flag Resolved</button>
                                </div>
                            </c:if>
                            <c:if test="${discrepancies.postcode != null}">
                                <div class="form-group">
                                    <label>Postcode:</label>
                                    <input type="text" class="form-control" value="${studentForm.postcode}" style="color: red;" readonly>
                                    <button type="button" class="btn btn-success btn-sm" onclick="resolveFlag('postcode', ${student.studentID}, 'student')">Flag Resolved</button>
                                </div>
                            </c:if>
                            <c:if test="${discrepancies.webaddress != null}">
                                <div class="form-group">
                                    <label>Web Address:</label>
                                    <input type="text" class="form-control" value="${studentForm.webaddress}" style="color: red;" readonly>
                                    <button type="button" class="btn btn-success btn-sm" onclick="resolveFlag('webaddress', ${student.studentID}, 'student')">Flag Resolved</button>
                                </div>
                            </c:if>
                            <c:if test="${discrepancies.contactname != null}">
                                <div class="form-group">
                                    <label>Contact Name:</label>
                                    <input type="text" class="form-control" value="${studentForm.contactname}" style="color: red;" readonly>
                                    <button type="button" class="btn btn-success btn-sm" onclick="resolveFlag('contactname', ${student.studentID}, 'student')">Flag Resolved</button>
                                </div>
                            </c:if>
                            <c:if test="${discrepancies.contactjobtitle != null}">
                                <div class="form-group">
                                    <label>Contact Job Title:</label>
                                    <input type="text" class="form-control" value="${studentForm.contactjobtitle}" style="color: red;" readonly>
                                    <button type="button" class="btn btn-success btn-sm" onclick="resolveFlag('contactjobtitle', ${student.studentID}, 'student')">Flag Resolved</button>
                                </div>
                            </c:if>
                            <c:if test="${discrepancies.contactemail != null}">
                                <div class="form-group">
                                    <label>Contact Email:</label>
                                    <input type="text" class="form-control" value="${studentForm.contactemail}" style="color: red;" readonly>
                                    <button type="button" class="btn btn-success btn-sm" onclick="resolveFlag('contactemail', ${student.studentID}, 'student')">Flag Resolved</button>
                                </div>
                            </c:if>
                            <c:if test="${discrepancies.contacttelephonenumber != null}">
                                <div class="form-group">
                                    <label>Contact Telephone Number:</label>
                                    <input type="text" class="form-control" value="${studentForm.contacttelephonenumber}" style="color: red;" readonly>
                                    <button type="button" class="btn btn-success btn-sm" onclick="resolveFlag('contacttelephonenumber', ${student.studentID}, 'student')">Flag Resolved</button>
                                </div>
                            </c:if>
                            <c:if test="${discrepancies.jobtitle != null}">
                                <div class="form-group">
                                    <label>Role Title:</label>
                                    <input type="text" class="form-control" value="${studentForm.roletitle}" style="color: red;" readonly>
                                    <button type="button" class="btn btn-success btn-sm" onclick="resolveFlag('jobtitle', ${student.studentID}, 'student')">Flag Resolved</button>
                                </div>
                            </c:if>
                            <c:if test="${discrepancies.rolestartdate != null}">
                                <div class="form-group">
                                    <label>Role Start Date:</label>
                                    <input type="date" class="form-control" value="${studentForm.rolestartdate}" style="color: red;" readonly>
                                    <button type="button" class="btn btn-success btn-sm" onclick="resolveFlag('rolestartdate', ${student.studentID}, 'student')">Flag Resolved</button>
                                </div>
                            </c:if>
                            <c:if test="${discrepancies.roleenddate != null}">
                                <div class="form-group">
                                    <label>Role End Date:</label>
                                    <input type="date" class="form-control" value="${studentForm.roleenddate}" style="color: red;" readonly>
                                    <button type="button" class="btn btn-success btn-sm" onclick="resolveFlag('roleenddate', ${student.studentID}, 'student')">Flag Resolved</button>
                                </div>
                            </c:if>
                            <c:if test="${discrepancies.workinghours != null}">
                                <div class="form-group">
                                    <label>Working Hours per Week:</label>
                                    <input type="number" class="form-control" value="${studentForm.workinghours}" style="color: red;" readonly>
                                    <button type="button" class="btn btn-success btn-sm" onclick="resolveFlag('workinghours', ${student.studentID}, 'student')">Flag Resolved</button>
                                </div>
                            </c:if>
                            <c:if test="${discrepancies.probationperiod != null}">
                                <div class="form-group">
                                    <label>Probation Period:</label>
                                    <input type="text" class="form-control" value="${studentForm.probationperiod}" style="color: red;" readonly>
                                    <button type="button" class="btn btn-success btn-sm" onclick="resolveFlag('probationperiod', ${student.studentID}, 'student')">Flag Resolved</button>
                                </div>
                            </c:if>
                            <c:if test="${discrepancies.workfromhome != null}">
                                <div class="form-group">
                                    <label>Work from Home:</label>
                                    <input type="text" class="form-control" value="${studentForm.workfromhome}" style="color: red;" readonly>
                                    <button type="button" class="btn btn-success btn-sm" onclick="resolveFlag('workfromhome', ${student.studentID}, 'student')">Flag Resolved</button>
                                </div>
                            </c:if>
                            <c:if test="${discrepancies.differentlocation != null}">
                                <div class="form-group">
                                    <label>Different Location:</label>
                                    <input type="text" class="form-control" value="${studentForm.differentlocation}" style="color: red;" readonly>
                                    <button type="button" class="btn btn-success btn-sm" onclick="resolveFlag('differentlocation', ${student.studentID}, 'student')">Flag Resolved</button>
                                </div>
                            </c:if>
                            <c:if test="${discrepancies.traveloverseas != null}">
                                <div class="form-group">
                                    <label>Travel Overseas:</label>
                                    <input type="text" class="form-control" value="${studentForm.traveloverseas}" style="color: red;" readonly>
                                    <button type="button" class="btn btn-success btn-sm" onclick="resolveFlag('traveloverseas', ${student.studentID}, 'student')">Flag Resolved</button>
                                </div>
                            </c:if>
                        </form>
                    </div>
                    <div class="col-md-6">
                        <h4>Provider Form</h4>
                        <form>
                            <c:if test="${discrepancies.studentFullName != null}">
                                <div class="form-group">
                                    <label>Student Name:</label>
                                    <input type="text" class="form-control" value="${providerForm.nameofstudent}" style="color: red;" readonly>
                                    <button type="button" class="btn btn-success btn-sm" onclick="resolveFlag('studentFullName', ${student.studentID}, 'provider')">Flag Resolved</button>
                                </div>
                            </c:if>
                            <c:if test="${discrepancies.addressofplacement != null}">
                                <div class="form-group">
                                    <label>Address of Placement:</label>
                                    <input type="text" class="form-control" value="${providerForm.address}" style="color: red;" readonly>
                                    <button type="button" class="btn btn-success btn-sm" onclick="resolveFlag('addressofplacement', ${student.studentID}, 'provider')">Flag Resolved</button>
                                </div>
                            </c:if>
                            <c:if test="${discrepancies.postcode != null}">
                                <div class="form-group">
                                    <label>Postcode:</label>
                                    <input type="text" class="form-control" value="${providerForm.postcode}" style="color: red;" readonly>
                                    <button type="button" class="btn btn-success btn-sm" onclick="resolveFlag('postcode', ${student.studentID}, 'provider')">Flag Resolved</button>
                                </div>
                            </c:if>
                            <c:if test="${discrepancies.webaddress != null}">
                                <div class="form-group">
                                    <label>Web Address:</label>
                                    <input type="text" class="form-control" value="${providerForm.webaddress}" style="color: red;" readonly>
                                    <button type="button" class="btn btn-success btn-sm" onclick="resolveFlag('webaddress', ${student.studentID}, 'provider')">Flag Resolved</button>
                                </div>
                            </c:if>
                            <c:if test="${discrepancies.contactname != null}">
                                <div class="form-group">
                                    <label>Contact Name:</label>
                                    <input type="text" class="form-control" value="${providerForm.nameofcontact}" style="color: red;" readonly>
                                    <button type="button" class="btn btn-success btn-sm" onclick="resolveFlag('contactname', ${student.studentID}, 'provider')">Flag Resolved</button>
                                </div>
                            </c:if>
                            <c:if test="${discrepancies.contactjobtitle != null}">
                                <div class="form-group">
                                    <label>Contact Job Title:</label>
                                    <input type="text" class="form-control" value="${providerForm.contactjobtitle}" style="color: red;" readonly>
                                    <button type="button" class="btn btn-success btn-sm" onclick="resolveFlag('contactjobtitle', ${student.studentID}, 'provider')">Flag Resolved</button>
                                </div>
                            </c:if>
                            <c:if test="${discrepancies.contactemail != null}">
                                <div class="form-group">
                                    <label>Contact Email:</label>
                                    <input type="text" class="form-control" value="${providerForm.contactemail}" style="color: red;" readonly>
                                    <button type="button" class="btn btn-success btn-sm" onclick="resolveFlag('contactemail', ${student.studentID}, 'provider')">Flag Resolved</button>
                                </div>
                            </c:if>
                            <c:if test="${discrepancies.contacttelephonenumber != null}">
                                <div class="form-group">
                                    <label>Contact Telephone Number:</label>
                                    <input type="text" class="form-control" value="${providerForm.contacttelephonenumber}" style="color: red;" readonly>
                                    <button type="button" class="btn btn-success btn-sm" onclick="resolveFlag('contacttelephonenumber', ${student.studentID}, 'provider')">Flag Resolved</button>
                                </div>
                            </c:if>
                            <c:if test="${discrepancies.jobtitle != null}">
                                <div class="form-group">
                                    <label>Role Title:</label>
                                    <input type="text" class="form-control" value="${providerForm.jobtitle}" style="color: red;" readonly>
                                    <button type="button" class="btn btn-success btn-sm" onclick="resolveFlag('jobtitle', ${student.studentID}, 'provider')">Flag Resolved</button>
                                </div>
                            </c:if>
                            <c:if test="${discrepancies.rolestartdate != null}">
                                <div class="form-group">
                                    <label>Role Start Date:</label>
                                    <input type="date" class="form-control" value="${providerForm.rolestartdate}" style="color: red;" readonly>
                                    <button type="button" class="btn btn-success btn-sm" onclick="resolveFlag('rolestartdate', ${student.studentID}, 'provider')">Flag Resolved</button>
                                </div>
                            </c:if>
                            <c:if test="${discrepancies.roleenddate != null}">
                                <div class="form-group">
                                    <label>Role End Date:</label>
                                    <input type="date" class="form-control" value="${providerForm.roleenddate}" style="color: red;" readonly>
                                    <button type="button" class="btn btn-success btn-sm" onclick="resolveFlag('roleenddate', ${student.studentID}, 'provider')">Flag Resolved</button>
                                </div>
                            </c:if>
                            <c:if test="${discrepancies.workinghours != null}">
                                <div class="form-group">
                                    <label>Working Hours per Week:</label>
                                    <input type="number" class="form-control" value="${providerForm.workinghours}" style="color: red;" readonly>
                                    <button type="button" class="btn btn-success btn-sm" onclick="resolveFlag('workinghours', ${student.studentID}, 'provider')">Flag Resolved</button>
                                </div>
                            </c:if>
                            <c:if test="${discrepancies.probationperiod != null}">
                                <div class="form-group">
                                    <label>Probation Period:</label>
                                    <input type="text" class="form-control" value="${providerForm.probationperiod}" style="color: red;" readonly>
                                    <button type="button" class="btn btn-success btn-sm" onclick="resolveFlag('probationperiod', ${student.studentID}, 'provider')">Flag Resolved</button>
                                </div>
                            </c:if>
                            <c:if test="${discrepancies.workfromhome != null}">
                                <div class="form-group">
                                    <label>Work from Home:</label>
                                    <input type="text" class="form-control" value="${providerForm.workfromhome}" style="color: red;" readonly>
                                    <button type="button" class="btn btn-success btn-sm" onclick="resolveFlag('workfromhome', ${student.studentID}, 'provider')">Flag Resolved</button>
                                </div>
                            </c:if>
                            <c:if test="${discrepancies.differentlocation != null}">
                                <div class="form-group">
                                    <label>Different Location:</label>
                                    <input type="text" class="form-control" value="${providerForm.workingfromdifferentsites}" style="color: red;" readonly>
                                    <button type="button" class="btn btn-success btn-sm" onclick="resolveFlag('differentlocation', ${student.studentID}, 'provider')">Flag Resolved</button>
                                </div>
                            </c:if>
                            <c:if test="${discrepancies.traveloverseas != null}">
                                <div class="form-group">
                                    <label>Travel Overseas:</label>
                                    <input type="text" class="form-control" value="${providerForm.traveloutsideuk}" style="color: red;" readonly>
                                    <button type="button" class="btn btn-success btn-sm" onclick="resolveFlag('traveloverseas', ${student.studentID}, 'provider')">Flag Resolved</button>
                                </div>
                            </c:if>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>

<script>
    function resolveFlag(field, studentID, source) {
        fetch('/resolveFlag', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ field, studentID, source }),
        })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    location.reload();
                } else {
                    alert('Error resolving flag');
                }
            })
            .catch(error => {
                console.error('Error:', error);
            });
    }
</script>
</body>
</html>

