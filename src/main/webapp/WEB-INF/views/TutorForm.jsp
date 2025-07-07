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
		<h1><u>Placement Assessment Form</u></h1>
		<p>
			This form should be completed by the allocated School Placement Tutor before a
			formal approval of a placement can be authorised, following a review of the
			Authorisation Request Form and Placement Provider Form. There is a Placement
			Assessment Guidance document available on SharePoint to take you through
			this form and any necessary additional actions and escalation.
		</p>

		<h2>Escalation</h2>

		<p>
			This following is generic escalation should any aspect of the placement assessment
			be considered “High” in risk. <br>

			<img src="/escalation1.png" alt="escalationprocedure1" class="img-fluid"><br><br>

			Throughout the guidance, there are instances where the Area Advisor is directed
			to seek further advice from the Placements Team who follow their own escalation.<br>

			<img src="/escalation2.png" alt="escalationprocedure2" class="img-fluid"><br><br>
		</p>

		<form action="/tutorForm" method="post">
			<input type="hidden" name="studentId" value="${studentId}">
			<h2>1. Student Information</h2>
			<label>a. Student Name:</label><br>
			<input type="text" class="form-control" id="studentname" name="studentname" value="${tutorForm.studentname}"><br>


			<h2>2. Placement Provider Information </h2>
			<label>a. Name of Organisation:</label><br>
			<input type="text" class="form-control" id="nameoforganisation" name="nameoforganisation" value="${tutorForm.nameoforganisation}"><br>

			<label>b. Assess the likely impact to the University’s reputation and integrity:</label><br>
			<select class="form-control" id="impact" name="impact">
				<option value="" ${tutorForm.impact == null ? 'selected' : ''}></option>
				<option value="Yes" ${tutorForm.impact == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${tutorForm.impact == 'No' ? 'selected' : ''}>No</option>
			</select><br>

			<h2>3. Information Match</h2>
			<label>a. Is the ‘Student Name’, ‘Employer Name’ and ‘Address where the placement will be based’ on the Authorisation Request Form and Placement Provider Form the same on both forms?</label><br>
			<select class="form-control" id="samedetails" name="samedetails">
				<option value="" ${tutorForm.samedetails == null ? 'selected' : ''}></option>
				<option value="Yes" ${tutorForm.samedetails == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${tutorForm.samedetails == 'No' ? 'selected' : ''}>No</option>
			</select><br>


			<h2>4. Placement Role Information</h2>
			<label>a. Does the placement role meet the minimum requirements for duration and hours needed as part of the degree programme?</label><br>
			<select class="form-control" id="meetrequirementshours" name="meetrequirementshours">
				<option value="" ${tutorForm.meetrequirementshours == null ? 'selected' : ''}></option>
				<option value="Yes" ${tutorForm.meetrequirementshours == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${tutorForm.meetrequirementshours == 'No' ? 'selected' : ''}>No</option>
			</select><br>

			<label>c. Has the placement provider confirmed that they will comply with the placement provider responsibilities?</label><br>
			<select class="form-control" id="providerconfirm" name="providerconfirm">
				<option value="" ${tutorForm.providerconfirm == null ? 'selected' : ''}></option>
				<option value="Yes" ${tutorForm.providerconfirm == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${tutorForm.providerconfirm == 'No' ? 'selected' : ''}>No</option>
			</select><br>

			<label>d. Do you have reasonable confidence that the proposed Placement Provider is an appropriate partner to allow students to meet the overall learning outcomes of the placement?</label><br>
			<select class="form-control" id="confidenceonprovider" name="confidenceonprovider">
				<option value="" ${tutorForm.confidenceonprovider == null ? 'selected' : ''}></option>
				<option value="Yes" ${tutorForm.confidenceonprovider == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${tutorForm.confidenceonprovider == 'No' ? 'selected' : ''}>No</option>
			</select><br>

			<label>e. Does the student have a Student visa?</label><br>
			<select class="form-control" id="studentvisa" name="studentvisa">
				<option value="" ${tutorForm.studentvisa == null ? 'selected' : ''}></option>
				<option value="Yes" ${tutorForm.studentvisa == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${tutorForm.studentvisa == 'No' ? 'selected' : ''}>No</option>
			</select><br>

			<label>f. Does the placement role start date, end date and duration comply with the Student VISA?</label><br>
			<select class="form-control" id="studentvisacomply" name="studentvisacomply">
				<option value="" ${tutorForm.studentvisacomply == null ? 'selected' : ''}></option>
				<option value="Yes" ${tutorForm.studentvisacomply == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${tutorForm.studentvisacomply == 'No' ? 'selected' : ''}>No</option>
				<option value="N/A" ${tutorForm.studentvisacomply == 'N/A' ? 'selected' : ''}>N/A</option>
			</select><br>


			<h2>5. Work Factors</h2>
			<label>a. Assess the organisations working conditions and environment for the placement role.</label><br>
			<select class="form-control" id="workingconditions" name="workingconditions">
				<option value="" ${tutorForm.workingconditions == null ? 'selected' : ''}></option>
				<option value="Low" ${tutorForm.workingconditions == 'Low' ? 'selected' : ''}>Low</option>
				<option value="Medium" ${tutorForm.workingconditions == 'Medium' ? 'selected' : ''}>Medium</option>
				<option value="High" ${tutorForm.workingconditions == 'High' ? 'selected' : ''}>High</option>
			</select><br>

			<label>b. Will the student be provided with appropriate training to undertake tasks?</label><br>
			<select class="form-control" id="training" name="training">
				<option value="" ${tutorForm.training == null ? 'selected' : ''}></option>
				<option value="Yes" ${tutorForm.training == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${tutorForm.training == 'No' ? 'selected' : ''}>No</option>
			</select><br>

			<label>c. Assess the likelihood of the student to be working from home.</label><br>
			<select class="form-control" id="workfromhome" name="workfromhome">
				<option value="" ${tutorForm.workfromhome == null ? 'selected' : ''}></option>
				<option value="Low" ${tutorForm.workfromhome == 'Low' ? 'selected' : ''}>Low</option>
				<option value="Medium" ${tutorForm.workfromhome == 'Medium' ? 'selected' : ''}>Medium</option>
				<option value="High" ${tutorForm.workfromhome == 'High' ? 'selected' : ''}>High</option>
			</select><br>

			<label>d. If the job involves international remote working, assess the legitimacy of the role.</label><br>
			<select class="form-control" id="internationalremoteworking" name="internationalremoteworking">
				<option value="" ${tutorForm.internationalremoteworking == null ? 'selected' : ''}></option>
				<option value="Low" ${tutorForm.internationalremoteworking == 'Low' ? 'selected' : ''}>Low</option>
				<option value="Medium" ${tutorForm.internationalremoteworking == 'Medium' ? 'selected' : ''}>Medium</option>
				<option value="High" ${tutorForm.internationalremoteworking == 'High' ? 'selected' : ''}>High</option>
				<option value="N/A" ${tutorForm.internationalremoteworking == 'N/A' ? 'selected' : ''}>N/A</option>
			</select><br>


			<h2>6. Travel and transport factors </h2>
			<label>a. Assess the likelihood of the student having significant travel issues to and from the place of work.</label><br>
			<select class="form-control" id="travelissues" name="travelissues">
				<option value="" ${tutorForm.travelissues == null ? 'selected' : ''}></option>
				<option value="Low" ${tutorForm.travelissues == 'Low' ? 'selected' : ''}>Low</option>
				<option value="Medium" ${tutorForm.travelissues == 'Medium' ? 'selected' : ''}>Medium</option>
				<option value="High" ${tutorForm.travelissues == 'High' ? 'selected' : ''}>High</option>
			</select><br>

			<label>b. Assess the likelihood that the student will be required to work across multiple sites other than the main Placement Provider address in section 2.</label><br>
			<select class="form-control" id="workinmultiplesites" name="workinmultiplesites">
				<option value="" ${tutorForm.workinmultiplesites == null ? 'selected' : ''}></option>
				<option value="Low" ${tutorForm.workinmultiplesites == 'Low' ? 'selected' : ''}>Low</option>
				<option value="Medium" ${tutorForm.workinmultiplesites == 'Medium' ? 'selected' : ''}>Medium</option>
				<option value="High" ${tutorForm.workinmultiplesites == 'High' ? 'selected' : ''}>High</option>
			</select><br>


			<h2>7. Location and regional factors</h2>
			<label>a. Assess the likelihood that the location of the main Placement Provider address in section 2 has any risks.</label><br>
			<select class="form-control" id="risks" name="risks">
				<option value="" ${tutorForm.risks == null ? 'selected' : ''}></option>
				<option value="Low" ${tutorForm.risks == 'Low' ? 'selected' : ''}>Low</option>
				<option value="Medium" ${tutorForm.risks == 'Medium' ? 'selected' : ''}>Medium</option>
				<option value="High" ${tutorForm.risks == 'High' ? 'selected' : ''}>High</option>
			</select><br>

			<label>b. Assess the risk of the student having inappropriate accommodation arrangements when on placement?</label><br>
			<select class="form-control" id="inappropriateaccommodation" name="inappropriateaccommodation">
				<option value="" ${tutorForm.inappropriateaccommodation == null ? 'selected' : ''}></option>
				<option value="Low" ${tutorForm.inappropriateaccommodation == 'Low' ? 'selected' : ''}>Low</option>
				<option value="Medium" ${tutorForm.inappropriateaccommodation == 'Medium' ? 'selected' : ''}>Medium</option>
				<option value="High" ${tutorForm.inappropriateaccommodation == 'High' ? 'selected' : ''}>High</option>
			</select><br>


			<h2>8. Health and Environmental Factors</h2>
			<label>a. Assess the likelihood of the student requiring to undertake precautionary measures to undertake the placement?</label><br>
			<select class="form-control" id="precautionarymeasures" name="precautionarymeasures">
				<option value="" ${tutorForm.precautionarymeasures == null ? 'selected' : ''}></option>
				<option value="Yes" ${tutorForm.precautionarymeasures == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${tutorForm.precautionarymeasures == 'No' ? 'selected' : ''}>No</option>
			</select><br>


			<h2>9. Personal Factors</h2>
			<label>a. Assess the likelihood of any of the students’ personal factors having any implications on undertaking the placement?</label><br>
			<select class="form-control" id="personalfactors" name="personalfactors">
				<option value="" ${tutorForm.personalfactors == null ? 'selected' : ''}></option>
				<option value="Yes" ${tutorForm.personalfactors == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${tutorForm.personalfactors == 'No' ? 'selected' : ''}>No</option>
				<option value="N/A" ${tutorForm.personalfactors == 'N/A' ? 'selected' : ''}>N/A</option>
			</select><br><br>


			<h2>10.	Policies and Insurance (See Section 10 and 11 of Placement Provider form).</h2>
			<label>a. Does the Placement Provider have in place public liability insurance (or equivalent) to cover students on placement?</label><br>
			<select class="form-control" id="publicliabilityinsurance" name="publicliabilityinsurance">
				<option value="" ${tutorForm.publicliabilityinsurance == null ? 'selected' : ''}></option>
				<option value="Yes" ${tutorForm.publicliabilityinsurance == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${tutorForm.publicliabilityinsurance == 'No' ? 'selected' : ''}>No</option>
			</select><br>

			<label>b. Does the Placement Provider have in place employer’s liability insurance (or equivalent) to cover students on placement?</label><br>
			<select class="form-control" id="employerliabilityinsurance" name="employerliabilityinsurance">
				<option value="" ${tutorForm.employerliabilityinsurance == null ? 'selected' : ''}></option>
				<option value="Yes" ${tutorForm.employerliabilityinsurance == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${tutorForm.employerliabilityinsurance == 'No' ? 'selected' : ''}>No</option>
			</select><br>

			<label>c. If applicable to the placement role, does the Placement Provider hold Professional Indemnity Insurance (or equivalent) that would cover the student?</label><br>
			<select class="form-control" id="professionalindemnityinsurance" name="professionalindemnityinsurance">
				<option value="" ${tutorForm.professionalindemnityinsurance == null ? 'selected' : ''}></option>
				<option value="Yes" ${tutorForm.professionalindemnityinsurance == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${tutorForm.professionalindemnityinsurance == 'No' ? 'selected' : ''}>No</option>
				<option value="N/A" ${tutorForm.professionalindemnityinsurance == 'N/A' ? 'selected' : ''}>N/A</option>
			</select><br>

			<label>d. Does the Placement Provider have in place an appropriate Health and Safety Policy at the location(s) where the student is to work?</label><br>
			<select class="form-control" id="healthandsafetypolicy" name="healthandsafetypolicy">
				<option value="" ${tutorForm.healthandsafetypolicy == null ? 'selected' : ''}></option>
				<option value="Yes" ${tutorForm.healthandsafetypolicy == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${tutorForm.healthandsafetypolicy == 'No' ? 'selected' : ''}>No</option>
			</select><br>


			<h2>11. University Access and Support</h2>
			<label>a. Does the Placement Provider have any objections to the University undertaking site visits to support the student?</label><br>
			<select class="form-control" id="objectionsofsitevisits" name="objectionsofsitevisits">
				<option value="" ${tutorForm.objectionsofsitevisits == null ? 'selected' : ''}></option>
				<option value="Yes" ${tutorForm.objectionsofsitevisits == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${tutorForm.objectionsofsitevisits == 'No' ? 'selected' : ''}>No</option>
			</select><br>

			<label>b. Does the Placement Provider have any issues relating to confidentiality or disclosure which the University will need to consider?</label><br>
			<select class="form-control" id="confidentiality" name="confidentiality">
				<option value="" ${tutorForm.confidentiality == null ? 'selected' : ''}></option>
				<option value="Yes" ${tutorForm.confidentiality == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${tutorForm.confidentiality == 'No' ? 'selected' : ''}>No</option>
			</select><br>


			<h2>12.	Placement Tutor Declaration and Signature (All Placements)</h2>
			<label>I have assessed the information provided in the Authorisation Request Form and the Placement Provider Form and have made the following decision:</label><br>
			<select class="form-control" id="decision" name="decision">
				<option value="" ${tutorForm.decision == null ? 'selected' : ''}></option>
				<option value="Placement request Authorised" ${tutorForm.decision == 'Placement request Authorised' ? 'selected' : ''}>Placement request Authorised</option>
				<option value="Placement request on hold until further information is provided (please provide reasons below)" ${tutorForm.decision == 'Placement request on hold until further information is provided (please provide reasons below)' ? 'selected' : ''}>Placement request on hold until further information is provided (please provide reasons below)</option>
				<option value="Placement request rejected (please provide reasons below)" ${tutorForm.decision == 'Placement request rejected (please provide reasons below)' ? 'selected' : ''}>Placement request rejected (please provide reasons below)</option>
			</select><br>

			<label>Reasons for decision:</label><br>
			<input type="text" class="form-control" id="reason" name="reason" value="${tutorForm.reason}"><br>

			<label>Name of Tutor:</label><br>
			<input type="text" class="form-control" id="nameoftutor" name="nameoftutor" value="${tutorForm.nameoftutor}"><br>

			<label>Placement Tutor Signature:</label><br>
			<input type="text" class="form-control" id="signature" name="signature" value="${tutorForm.signature}"><br>

			<%--			<label>Date:</label><br>--%>
			<%--			<input type="date" class="form-control" id="date" name="date" value="${tutorForm.date}"><br>--%>

			<label>Allocated Placement Supervisor:</label><br>
			<input type="text" class="form-control" id="supervisor" name="supervisor" value="${tutorForm.supervisor}"><br>


			<h2>13. Overseas Placements Only - College Director of Operations Sign Off (or delegated authority)</h2>
			<label>College Director of Operations Signature:</label><br>
			<input type="text" class="form-control" id="directorsignature" name="directorsignature" value="${tutorForm.directorsignature}"><br>

			<%--			<label>Date:</label><br>--%>
			<%--			<input type="date" class="form-control" id="directordate" name="directordate" value="${tutorForm.directordate}"><br>--%>


			<c:choose>
				<c:when test="${isSubmitted}">
					<p>You have already submitted this form.</p>
					<button type="submit" formaction="/saveTutorForm" disabled>Save</button>
					<button type="submit" disabled>Submit</button>
				</c:when>
				<c:otherwise>
					<button type="submit" formaction="/saveTutorForm">Save</button>
					<button type="submit">Submit</button>
				</c:otherwise>
			</c:choose>
		</form>
	</section>
</main>
</body>
</html>

