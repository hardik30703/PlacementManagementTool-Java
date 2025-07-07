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

	.profile-picture {
		width: 40px;
		height: 40px;
		border-radius: 50%;
		object-fit: cover;
	}
</style>
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

<main class="container"><br>
	<section class="info-section">
		<h1><u>Placement Authorisation Request Form</u></h1>
		<p>
			This form is to be completed by a University of Leicester student to notify the University of Leicester about a placement offer.
			By submitting this form, you request authorisation to have the role form part of your degree programme.
			We will use this form to assess the placement role you have been offered
		</p>

		<h2>Your Responsibilities as a Placement Student</h2>

		<p>
			By submitting this form, you confirm that you will meet the following requirements for your placement:<br>
			1.	Act professionally and responsibly, both in your studies and on placement, as well as, if required, during your meeting probation periods.
			You must conduct yourselves accordingly with due regard to the University Senate Regulations, the Placement Provider, and the laws and conventions of the country in which you are undertaking your placement.<br>
			2.	Adhere to attendance requirements and working hours stipulated by the University and on your visa.
			This involves not working more than the hours stated, either inside or outside of the University.<br>
			3.	If your placement involves is overseas, you must register for insurance under the Group Personal Accident and Travel Policy arranged by the University.
			To register, please read through the guidance on the Overseas Travel SharePoint page and complete the Student Travel Insurance Request.<br>
			a.	If your employer requires you to travel (either overseas or within the same country) as part of the job description, it is the employer responsibility to ensure the travel is risk assessed and insured.<br>
			4.	Inform the University if you have any queries or concerns about your placement or Placement Provider. <br>
			5.	Update the University immediately if any of your placement details change. <br>
			6.	Contact the University and the Placement Provider if you require special adjustments to be made in order to undertake the placement<br>
			7.	Notify the University if you are absent from your placement for more than 5 days in a row.  <br>
			8.	Check your university email account regularly for communications from the University.<br>
			9.	Complete any tasks and assessment throughout the duration of the placement within the deadlines specified. <br>
		</p>

		<h2>Getting your placement authorised</h2>

		<p>
			Once you submit this form, the University will ask your Placement Provider to provide further information, and assess your placement. Most placements are approved. However, common reasons that a placement might be rejected include:<br>
			1.	The Placement is unpaid and does not offer a high-quality work experience.<br>
			2.	The Placement involves a high level of risk. As part of this, we consider whether an employer has insurance to cover you for accidents.<br>
			3.	The Placement Provider seems illegitimate, or is operating illegally. <br>
			4.	The Placement does not guarantee a high-quality learning experience. When we consider this, we will look at the role description, the placement provider, and how much remote working is planned on placement.<br>
			Please fill in every section required<br>
			Important Note: Do not commit funds for your placement and travel arrangements until the placement and risk assessment have been approved
		</p>

		<form action="/StudentForm" method="post">
			<h2>1. Student Details</h2>
			<label>a. First name:</label><br>
			<input type="text" class="form-control" id="firstname" name="firstname" value="${studentForm.firstname}"><br>

			<label>b. Last name:</label><br>
			<input type="text" class="form-control" id="lastname" name="lastname" value="${studentForm.lastname}"><br>

			<label>c. Student Number:</label><br>
			<input type="text" class="form-control" id="studentnumber" name="studentnumber" value="${studentForm.studentnumber}"><br>

			<label>d. Student Email:</label><br>
			<input type="text" class="form-control" id="studentemail" name="studentemail" value="${studentForm.studentemail}"><br>

			<label>e. Programme of study:</label><br>
			<input type="text" class="form-control" id="programme" name="programme" value="${studentForm.programme}"><br>

			<label>f. School or Department:</label><br>
			<input type="text" class="form-control" id="department" name="department" value="${studentForm.department}"><br>

			<label>g. Contact Telephone number:</label><br>
			<input type="text" class="form-control" id="telephonenumber" name="telephonenumber" value="${studentForm.telephonenumber}"><br>

			<label>h. Are you an international student with a Student Visa: If No skip to section 2</label><br>
			<select class="form-control" id="internationalstudent" name="internationalstudent">
				<option value="" ${studentForm.internationalstudent == null ? 'selected' : ''}></option>
				<option value="Yes" ${studentForm.internationalstudent == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${studentForm.internationalstudent == 'No' ? 'selected' : ''}>No</option>
			</select><br>

			<div id="visa-questions" style="display: none;">
				<label>i. Does your Student Visa duration account for your placement:</label><br>
				<select class="form-control" id="studentvisa" name="studentvisa">
					<option value="" ${studentForm.studentvisa == null ? 'selected' : ''}></option>
					<option value="Yes" ${studentForm.studentvisa == 'Yes' ? 'selected' : ''}>Yes</option>
					<option value="No" ${studentForm.studentvisa == 'No' ? 'selected' : ''}>No</option>
				</select>
			</div>


			<h2>2. Placement Provider Details</h2>
			<label>a. Name of Organisation:</label><br>
			<input type="text" class="form-control" id="nameoforganisation" name="nameoforganisation" value="${studentForm.nameoforganisation}"><br>

			<label>b. Address where the placement will be based:</label><br>
			<input type="text" class="form-control" id="addressofplacement" name="addressofplacement" value="${studentForm.addressofplacement}"><br>

			<label>c. Postcode:</label><br>
			<input type="text" class="form-control" id="postcode" name="postcode" value="${studentForm.postcode}"><br>

			<label>d. Web Address:</label><br>
			<input type="text" class="form-control" id="webaddress" name="webaddress" value="${studentForm.webaddress}"><br>

			<label>e. Contact Name:</label><br>
			<input type="text" class="form-control" id="contactname" name="contactname" value="${studentForm.contactname}"><br>

			<label>f. Contact Job Title:</label><br>
			<input type="text" class="form-control" id="contactjobtitle" name="contactjobtitle" value="${studentForm.contactjobtitle}"><br>

			<label>g. Contact Email:</label><br>
			<input type="text" class="form-control" id="contactemail" name="contactemail" value="${studentForm.contactemail}"><br>

			<label>h. Contact Telephone Number:</label><br>
			<input type="text" class="form-control" id="contacttelephonenumber" name="contacttelephonenumber" value="${studentForm.contacttelephonenumber}"><br><br>


			<h2>3. Placement Role Details</h2>
			<label>a. Role Title:</label><br>
			<input type="text" class="form-control" id="roletitle" name="roletitle" value="${studentForm.roletitle}"><br>

			<label>b. Role Start date:</label><br>
			<input type="date" class="form-control" id="rolestartdate" name="rolestartdate" value="${studentForm.rolestartdate}"><br>

			<label>c. Role End date (expected month if unknown):</label><br>
			<input type="date" class="form-control" id="roleenddate" name="roleenddate" value="${studentForm.roleenddate}"><br>

			<label>d. Working hours per week:</label><br>
			<input type="text" class="form-control" id="workinghours" name="workinghours" value="${studentForm.workinghours}"><br>

			<label>e. Does your role include a probation period:</label><br>
			<select class="form-control" id="probationperiod" name="probationperiod">
				<option value="" ${studentForm.probationperiod == null ? 'selected' : ''}></option>
				<option value="Yes" ${studentForm.probationperiod == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${studentForm.probationperiod == 'No' ? 'selected' : ''}>No</option>
			</select><br>

			<div id="probationPeriodLength" style="display: none;">
				<label>e.i. Please confirm length of your probation period:</label><br>
				<input type="text" class="form-control" id="lengthofprobationperiod" name="lengthofprobationperiod" value="${studentForm.lengthofprobationperiod}"><br>
			</div>

			<label>f. What is your salary for the placement (per year) :</label><br>
			<input type="number" class="form-control" id="salary" name="salary" value="${studentForm.salary}"><br>

			<label>g. How did you source this role:</label><br>
			<input type="text" class="form-control" id="source" name="source" value="${studentForm.source}"><br>

			<label>h. Have you informed the Placement Provider that this placement forms part of your degree programme: If no, please inform the Placement Provider before proceeding with this form</label><br>
			<select class="form-control" id="informedplacementprovider" name="informedplacementprovider">
				<option value="" ${studentForm.informedplacementprovider == null ? 'selected' : ''}></option>
				<option value="Yes" ${studentForm.informedplacementprovider == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${studentForm.informedplacementprovider == 'No' ? 'selected' : ''}>No</option>
			</select><br>

			<label>i. Please provide a role description for your placement:</label><br>
			<input type="text" class="form-control" id="roledescription" name="roledescription" value="${studentForm.roledescription}"><br><br>


			<h2>4. Work Factors</h2>
			<label>a. Does this role involve working from home/remotely (This includes hybrid working):</label><br>
			<select class="form-control" id="workfromhome" name="workfromhome">
				<option value="" ${studentForm.workfromhome == null ? 'selected' : ''}></option>
				<option value="Yes" ${studentForm.workfromhome == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${studentForm.workfromhome == 'No' ? 'selected' : ''}>No</option>
			</select><br>

			<div id="workFromHomeDetails" style="display: none;">
				<label>b. Please provide an overview of how you will work remotely. This should include how often you will work remotely each week:</label><br>
				<input type="text" class="form-control" id="howremotely" name="howremotely" value="${studentForm.howremotely}"><br>
				<label>c. Why does this role involve working from home:</label><br>
				<input type="text" class="form-control" id="whyworkfromhome" name="whyworkfromhome" value="${studentForm.whyworkfromhome}"><br><br>
			</div>


			<h2>5. Transport and Travel Factors</h2>
			<label>a. How will you travel to and from the placement and residence:</label><br>
			<input type="text" class="form-control" id="commute" name="commute" value="${studentForm.commute}"><br>

			<label>b. Does this role involve working at a location different to the Placement Providers address that you have given in section 2:</label><br>
			<select class="form-control" id="differentlocation" name="differentlocation">
				<option value="" ${studentForm.differentlocation == null ? 'selected' : ''}></option>
				<option value="Yes" ${studentForm.differentlocation == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${studentForm.differentlocation == 'No' ? 'selected' : ''}>No</option>
			</select><br>

			<div id="locationDetails" style="display: none;">
				<label>b.i. Please provide details:</label><br>
				<input type="text" class="form-control" id="details" name="details" value="${studentForm.details}"><br>
			</div>

			<label>c. Does your placement require travel overseas:</label><br>
			<select class="form-control" id="traveloverseas" name="traveloverseas">
				<option value="" ${studentForm.traveloverseas == null ? 'selected' : ''}></option>
				<option value="Yes" ${studentForm.traveloverseas == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${studentForm.traveloverseas == 'No' ? 'selected' : ''}>No</option>
				<option value="Don't Know" ${studentForm.traveloverseas == 'Dont Know' ? 'selected' : ''}>Don't Know</option>
			</select><br>

			<div id="overseasPlacementQuestions" style="display: none;">
				<label>d. Overseas Placement. Have you read the overseas travel guidance:</label><br>
				<select class="form-control" id="travelguidance" name="travelguidance">
					<option value="" ${studentForm.travelguidance == null ? 'selected' : ''}></option>
					<option value="Yes" ${studentForm.travelguidance == 'Yes' ? 'selected' : ''}>Yes</option>
					<option value="No" ${studentForm.travelguidance == 'No' ? 'selected' : ''}>No</option>
				</select><br>

				<label>e. Overseas Placement. Have you considered how you will travel to your country of work and financing this:</label><br>
				<select class="form-control" id="traveltowork" name="traveltowork">
					<option value="" ${studentForm.traveltowork == null ? 'selected' : ''}></option>
					<option value="Yes" ${studentForm.traveltowork == 'Yes' ? 'selected' : ''}>Yes</option>
					<option value="No" ${studentForm.traveltowork == 'No' ? 'selected' : ''}>No</option>
				</select><br><br>
			</div>


			<h2>6. Location and Regional Factors</h2>
			<label>a. What are your accommodation arrangements when on placement: Rent shared house/Rent individual house/Live at home/other</label><br>
			<input type="text" class="form-control" id="accommodationarrangements" name="accommodationarrangements" value="${studentForm.accommodationarrangements}"><br>

			<div id="overseasPlacementQuestions1" style="display: none;">
				<label>b. Overseas Placement. Have you checked the Foreign, Commonwealth and Development Office for information on the country of your placement:</label><br>
				<select class="form-control" id="foreignoffice" name="foreignoffice">
					<option value="" ${studentForm.foreignoffice == null ? 'selected' : ''}></option>
					<option value="Yes" ${studentForm.foreignoffice == 'Yes' ? 'selected' : ''}>Yes</option>
					<option value="No" ${studentForm.foreignoffice == 'No' ? 'selected' : ''}>No</option>
				</select><br>

				<label>c. Overseas Placement. Are you aware of any risks at the organisation's main location? For example, this might include civil disorder, crime, environmental disasters, infectious disease, or poor healthcare access (this includes the COVID risk): If no, please go back to the question above.</label><br>
				<select class="form-control" id="risks" name="risks">
					<option value="" ${studentForm.risks == null ? 'selected' : ''}></option>
					<option value="Yes" ${studentForm.risks == 'Yes' ? 'selected' : ''}>Yes</option>
					<option value="No" ${studentForm.risks == 'No' ? 'selected' : ''}>No</option>
					<option value="No Risks" ${studentForm.risks == 'No Risks' ? 'selected' : ''}>No Risks</option>
				</select><br><br>
			</div>


			<h2>7. Health and Environmental Factors</h2>
			<label>a. Are you aware of any precautionary measures you are required to undertake before, during, or after the placement? For example: vaccinations, PPE, medical or dietary advice, living arrangements:</label><br>
			<select class="form-control" id="precautionarymeasures" name="precautionarymeasures">
				<option value="" ${studentForm.precautionarymeasures == null ? 'selected' : ''}></option>
				<option value="Yes" ${studentForm.precautionarymeasures == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${studentForm.precautionarymeasures == 'No' ? 'selected' : ''}>No</option>
			</select><br>

			<label>b. Have you downloaded the SafeZone app using your university credentials:</label><br>
			<select class="form-control" id="safezone" name="safezone">
				<option value="" ${studentForm.safezone == null ? 'selected' : ''}></option>
				<option value="Yes" ${studentForm.safezone == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${studentForm.safezone == 'No' ? 'selected' : ''}>No</option>
			</select><br>

			<div id="overseasPlacementQuestions2" style="display: none;">
				<label>c. Overseas Placement. Have you applied for your Global Health Insurance Card:</label><br>
				<select class="form-control" id="healthinsurancecard" name="healthinsurancecard">
					<option value="" ${studentForm.healthinsurancecard == null ? 'selected' : ''}></option>
					<option value="Yes" ${studentForm.healthinsurancecard == 'Yes' ? 'selected' : ''}>Yes</option>
					<option value="No" ${studentForm.healthinsurancecard == 'No' ? 'selected' : ''}>No</option>
					<option value="Country not in EU" ${studentForm.healthinsurancecard == 'Country not in EU' ? 'selected' : ''}>Country not in EU</option>
				</select><br><br>
			</div>

			<h2>8. Personal Factors</h2>
			<label>a. Have you considered any adjustments with your employer that may be required for you to carry out the role relating to any disability or health condition:</label><br>
			<select class="form-control" id="adjustments" name="adjustments">
				<option value="" ${studentForm.adjustments == null ? 'selected' : ''}></option>
				<option value="Yes" ${studentForm.adjustments == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${studentForm.adjustments == 'No' ? 'selected' : ''}>No</option>
				<option value="N/A" ${studentForm.adjustments == 'N/A' ? 'selected' : ''}>N/A</option>
			</select><br><br>

			<div id="overseasPlacementQuestions3" style="display: none;">
				<h2>9. Policies and Insurance (Overseas Placement)</h2>
				<label>a. Are you aware that you must submit a Student Travel Application Form once your placement has been approved:</label><br>
				<select class="form-control" id="travelapplication" name="travelapplication">
					<option value="" ${studentForm.travelapplication == null ? 'selected' : ''}></option>
					<option value="Yes" ${studentForm.travelapplication == 'Yes' ? 'selected' : ''}>Yes</option>
					<option value="No" ${studentForm.travelapplication == 'No' ? 'selected' : ''}>No</option>
				</select><br>

				<label>b. Is your country of work listed as one that require risk assessment escalation:</label><br>
				<select class="form-control" id="riskassessmentescalation" name="riskassessmentescalation">
					<option value="" ${studentForm.riskassessmentescalation == null ? 'selected' : ''}></option>
					<option value="Yes" ${studentForm.riskassessmentescalation == 'Yes' ? 'selected' : ''}>Yes</option>
					<option value="No" ${studentForm.riskassessmentescalation == 'No' ? 'selected' : ''}>No</option>
				</select><br><br>
			</div>


			<h2>Declaration and Signature</h2>
			<p1>Please remember you are representing the University of Leicester while you are on a placement. <br>
				By completing this form you accept the conditions and requirements listed in the Responsibilities of Students on page one of this document. You also confirm all the information provided in this form is factually correct at the time of submitting<br><br></p1>
			<label>Name:</label><br>
			<input type="text" class="form-control" id="name" name="name" value="${studentForm.name}"><br>

			<label>Signature:</label><br>
			<input type="text" class="form-control" id="signature" name="signature" value="${studentForm.signature}"><br>

<%--			<label>Date:</label><br>--%>
<%--			<input type="date" class="form-control" id="date" name="date" value="${studentForm.date}"><br>--%>

			<c:choose>
				<c:when test="${isSubmitted}">
					<p>You have already submitted this form.</p>
					<button type="submit" formaction="/saveStudentForm" disabled>Save</button>
					<button type="submit" disabled>Submit</button>
				</c:when>
				<c:otherwise>
					<button type="submit" formaction="/saveStudentForm">Save</button>
					<button type="submit">Submit</button>
				</c:otherwise>
			</c:choose>
		</form>
	</section>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>
	const internationalStudentSelect = document.getElementById('internationalstudent');
	const visaQuestions = document.getElementById('visa-questions');

	// Add event listener to the select element
	internationalStudentSelect.addEventListener('change', function() {
		if (this.value === 'Yes') {
			visaQuestions.style.display = 'block'; // Show visa questions
		} else {
			visaQuestions.style.display = 'none';  // Hide visa questions
		}
	});

	const probationPeriodSelect = document.getElementById('probationperiod');
	const probationPeriodLengthDiv = document.getElementById('probationPeriodLength');

	probationPeriodSelect.addEventListener('change', function() {
		if (this.value === 'Yes') {
			probationPeriodLengthDiv.style.display = 'block';
		} else {
			probationPeriodLengthDiv.style.display = 'none';
		}
	});

	const workFromHomeSelect = document.getElementById('workfromhome');
	const workFromHomeDetailsDiv = document.getElementById('workFromHomeDetails');

	workFromHomeSelect.addEventListener('change', function() {
		if (this.value === 'Yes') {
			workFromHomeDetailsDiv.style.display = 'block';
		} else {
			workFromHomeDetailsDiv.style.display = 'none';
		}
	});

	const differentLocationSelect = document.getElementById('differentlocation');
	const locationDetailsDiv = document.getElementById('locationDetails');

	differentLocationSelect.addEventListener('change', function() {
		if (this.value === 'Yes') {
			locationDetailsDiv.style.display = 'block';
		} else {
			locationDetailsDiv.style.display = 'none';
		}
	});

	const travelOverseasSelect = document.getElementById('traveloverseas');
	const overseasPlacementQuestionsDiv = document.getElementById('overseasPlacementQuestions');
	const overseasPlacementQuestionsDiv1 = document.getElementById('overseasPlacementQuestions1');
	const overseasPlacementQuestionsDiv2 = document.getElementById('overseasPlacementQuestions2');
	const overseasPlacementQuestionsDiv3 = document.getElementById('overseasPlacementQuestions3');

	travelOverseasSelect.addEventListener('change', function() {
		if (this.value === 'Yes') {
			overseasPlacementQuestionsDiv.style.display = 'block';
			overseasPlacementQuestionsDiv1.style.display = 'block';
			overseasPlacementQuestionsDiv2.style.display = 'block';
			overseasPlacementQuestionsDiv3.style.display = 'block';
		} else {
			overseasPlacementQuestionsDiv.style.display = 'none';
			overseasPlacementQuestionsDiv1.style.display = 'none';
			overseasPlacementQuestionsDiv2.style.display = 'none';
			overseasPlacementQuestionsDiv3.style.display = 'none';
		}
	});
</script>
</body>
</html>

