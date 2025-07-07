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
<body onload="checkPostcode()">
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
		<form action="/ProviderForm" method="post">
			<input type="hidden" class="form-control" id="studentId" name="studentId" value="${studentId}" readonly>

			<h2>1. Placement Provider Details</h2>
			<label>a. Name of Organisation:</label><br>
			<input type="text" class="form-control" id="nameoforganisation" name="nameoforganisation" value="${providerForm.nameoforganisation}" readonly><br>

			<label>b. Address where the placement will be based:</label><br>
			<input type="text" class="form-control" id="address" name="address" value="${providerForm.address}" readonly><br>

			<label>c. Postcode:</label><br>
			<input type="text" class="form-control" id="postcode" name="postcode" value="${providerForm.postcode}" readonly><br>

			<label>d. Web Address:</label><br>
			<input type="text" class="form-control" id="webaddress" name="webaddress" value="${providerForm.webaddress}" readonly><br>

			<label>e. Does your organisation undertake any activity in the following areas:<br>
				-	Environmental damage<br>
				-	Manufacture and sale of armaments<br>
				-	Manufacture and sale of tobacco products<br>
				-	Activities abroad which would be considered illegal in the UK<br>
				-	The causing of harm or injury to third parties<br>
				-	Gambling/gaming involving money at risk<br>
			</label><br>
			<select class="form-control" id="activity" name="activity" disabled>
				<option value=""></option>
				<option value="Yes" ${providerForm.activity == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${providerForm.activity == 'No' ? 'selected' : ''}>No</option>
				<option value="Unsure" ${providerForm.activity == 'Unsure' ? 'selected' : ''}>Unsure</option>
			</select><br>

			<div id="activityDetails" style="display: none;">
				<label>e.i Please provide details:</label><br>
				<input type="text" class="form-control" id="details" name="details" value="${providerForm.details}" readonly><br>
			</div>

			<h2>2. Placement Student</h2>
			<label>a. Name of University of Leicester student:</label><br>
			<input type="text" class="form-control" id="nameofstudent" name="nameofstudent" value="${providerForm.nameofstudent}" readonly><br>


			<h2>3. Placement Provider named contact for University and Placement Student</h2>
			<label>a. Name of main contact:<br>
				Please note: This person will need to be accessible as the University will be in touch via email or telephone throughout the placement.</label><br>
			<input type="text" class="form-control" id="nameofcontact" name="nameofcontact" value="${providerForm.nameofcontact}" readonly><br>

			<label>b. Contact Job Title:</label><br>
			<input type="text" class="form-control" id="contactjobtitle" name="contactjobtitle" value="${providerForm.contactjobtitle}" readonly><br>

			<label>c. Contact Email:</label><br>
			<input type="text" class="form-control" id="contactemail" name="contactemail" value="${providerForm.contactemail}" readonly><br>

			<label>c. Contact Telephone Number:</label><br>
			<input type="text" class="form-control" id="contacttelephonenumber" name="contacttelephonenumber" value="${providerForm.contacttelephonenumber}" readonly><br>


			<h2>4. Placement Role details</h2>
			<label>a. Job Title:</label><br>
			<input type="text" class="form-control" id="jobtitle" name="jobtitle" value="${providerForm.jobtitle}" readonly><br>

			<label>b. Role Start date:</label><br>
			<input type="date" class="form-control" id="rolestartdate" name="rolestartdate" value="${providerForm.rolestartdate}" readonly><br>

			<label>c. Role End date (expected month if unknown):</label><br>
			<input type="date" class="form-control" id="roleenddate" name="roleenddate" value="${providerForm.roleenddate}" readonly><br>

			<label>d. Working hours per week:</label><br>
			<input type="text" class="form-control" id="workinghours" name="workinghours" value="${providerForm.workinghours}" readonly><br>

			<label>e. Does your role include a probation period:</label><br>
			<select class="form-control" id="probationperiod" name="probationperiod" disabled>
				<option value=""></option>
				<option value="Yes" ${providerForm.probationperiod == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${providerForm.probationperiod == 'No' ? 'selected' : ''}>No</option>
			</select><br>

			<div id="probationPeriodAssessement" style="display: none;">
				<label>e.i. Please provide information on how the probation period will be assessed:</label><br>
				<input type="text" class="form-control" id="probationperiodassessed" name="probationperiodassessed" value="${providerForm.probationperiodassessed}" readonly><br>
			</div>

			<label>f. Please outline what you expect the student to achieve by the end of the role:</label><br>
			<input type="text" class="form-control" id="expectation" name="expectation" value="${providerForm.expectation}" readonly><br>


			<h2>5. Work Factors</h2>
			<label>a. Will the nature of the work undertaken by the student expose them to any hazards or risks?<br>
				For example this might include operating machinery, working with hazardous materials, or supporting vulnerable children or adults.
			</label><br>
			<select class="form-control" id="hazardsorrisks" name="hazardsorrisks" disabled>
				<option value=""></option>
				<option value="Yes" ${providerForm.hazardsorrisks == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${providerForm.hazardsorrisks == 'No' ? 'selected' : ''}>No</option>
			</select><br>

			<div id="detailsOfRisks" style="display: none;">
				<label>a.i. Please provide details below of the hazards or risks the student will be exposed to, and how you will support them with this:</label><br>
				<input type="text" class="form-control" id="detailsofrisksandhazards" name="detailsofrisksandhazards" value="${providerForm.detailsofrisksandhazards}" readonly><br>
			</div>

			<label>b. Does the student need any specific training for the role or to undertake tasks?:</label><br>
			<select class="form-control" id="training" name="training" disabled>
				<option value=""></option>
				<option value="Yes" ${providerForm.training == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${providerForm.training == 'No' ? 'selected' : ''}>No</option>
			</select><br>

			<div id="trainingDetails" style="display: none;">
				<label>b.i. Please provide details of how the training will be provided:</label><br>
				<input type="text" class="form-control" id="detailsoftraining" name="detailsoftraining" value="${providerForm.detailsoftraining}" readonly><br>
			</div>

			<label>c. Does the role involve the student working from their home?:</label><br>
			<select class="form-control" id="workfromhome" name="workfromhome" disabled>
				<option value=""></option>
				<option value="Yes" ${providerForm.workfromhome == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${providerForm.workfromhome == 'No' ? 'selected' : ''}>No</option>
			</select><br>

			<div id="frequencyOfWorkFromHome" style="display: none;">
				<label>d. How frequently will they work from home:</label><br>
				<select class="form-control" id="frequencyworkfromhome" name="frequencyworkfromhome" disabled>
					<option value=""></option>
					<option value="Permanantly" ${providerForm.frequencyworkfromhome == 'Permanantly' ? 'selected' : ''}>Permanantly</option>
					<option value="HybridWorking" ${providerForm.frequencyworkfromhome == 'HybridWorking' ? 'selected' : ''}>Hybrid working e.g. two days in office, three days working from home </option>
					<option value="FullyRemote" ${providerForm.frequencyworkfromhome == 'FullyRemote' ? 'selected' : ''}>Fully Remote</option>
				</select><br>

				<label>e. How will the student be monitored and supported during periods that they are working from home?</label><br>
				<input type="text" class="form-control" id="supportforworkfromhome" name="supportforworkfromhome"  value="${providerForm.supportforworkfromhome}" readonly><br>
			</div>


			<h2>6. Travel and transport factors</h2>
			<label>a. Does the role involve working from sites other than the main address (the address provided in section 1):</label><br>
			<select class="form-control" id="workingfromdifferentsites" name="workingfromdifferentsites" disabled>
				<option value=""></option>
				<option value="Yes" ${providerForm.workingfromdifferentsites == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${providerForm.workingfromdifferentsites == 'No' ? 'selected' : ''}>No</option>
			</select><br>

			<div id="travelDetails" style="display: none;">
				<label>b.i. Please provide details below of how the student will travel from the main address to other sites (e.g. train, company car etc.):</label><br>
				<input type="text" class="form-control" id="detailsoftravel" name="detailsoftravel" value="${providerForm.detailsoftravel}" readonly><br>
			</div>

			<label>b. Does this placement require any travel outside of the UK?
				<br>
				Please note: If a student is travelling overseas at the Placement Providers request, (as part of the job description) then the university
				is not responsible for the travel insurance and it is the Placement Provider responsibility to risk assess the travel.
				If the student is travelling overseas to attend the placement, then the responsibility is with university
			</label><br>
			<select class="form-control" id="traveloutsideuk" name="traveloutsideuk"disabled>
				<option value=""></option>
				<option value="Yes" ${providerForm.traveloutsideuk == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${providerForm.traveloutsideuk == 'No' ? 'selected' : ''}>No</option>
			</select><br><br>


			<h2>7. Location and regional factors</h2>
			<label>a. Does the organisation’s main location for the student present any risks?
				<br>
				For example, this might include civil disorder, crime, environmental disasters,
				infectious disease, or poor healthcare access.
			</label><br>
			<select class="form-control" id="risksatmainlocation" name="risksatmainlocation" disabled>
				<option value=""></option>
				<option value="Yes" ${providerForm.risksatmainlocation == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${providerForm.risksatmainlocation == 'No' ? 'selected' : ''}>No</option>
			</select><br>

			<div id="risksandactionsDetails" style="display: none;">
				<label>b.i. Please provide details below of the risks and actions in place to minimise the risk:</label><br>
				<input type="text" class="form-control" id="detailsofrisksandactions" name="detailsofrisksandactions" value="${providerForm.detailsofrisksandactions}" readonly><br>
			</div>


			<h2>8.Health and Environmental Factors</h2>
			<label>a. Is the student required to take precautionary measures to undertake the placement?
				<br>
				For example, this might include vaccinations, PPE, medical or dietary advice, or specific living arrangements
			</label><br>
			<select class="form-control" id="precautionarymeasures" name="precautionarymeasures" disabled>
				<option value=""></option>
				<option value="Yes" ${providerForm.precautionarymeasures == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${providerForm.precautionarymeasures == 'No' ? 'selected' : ''}>No</option>
			</select><br>

			<div id="precautionarymeasuresDetails" style="display: none;">
				<label>b.i. Please provide details below of the precautionary measures:</label><br>
				<input type="text" class="form-control" id="detailsofprecautionarymeasures" name="detailsofprecautionarymeasures" value="${providerForm.detailsofprecautionarymeasures}" readonly><br>
			</div>


			<h2>9. Personal Factors</h2>
			<label>a. If required, are you able to support students with any personal factors that may affect their placement?
				<br>
				For example, this might include making reasonable adjustments for physical or mental health conditions or disabilities.
			</label><br>
			<select class="form-control" id="personalfactors" name="personalfactors" disabled>
				<option value=""></option>
				<option value="Yes" ${providerForm.personalfactors == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${providerForm.personalfactors == 'No' ? 'selected' : ''}>No</option>
			</select><br><br>

			<div id="ukQuestions" style="display: none;">
				<h2>10.	Policies and Insurance (UK Providers Only)</h2>
				<label>a. UK providers only: Does your organisation hold Public Liability Insurance or equivalent?
					<br>
					Equivalent within the UK may refer to self-insurance or crown indemnity insurance (NHS).
				</label><br>
				<select class="form-control" id="publicliabilityinsurance" name="publicliabilityinsurance" disabled>
					<option value=""></option>
					<option value="Yes" ${providerForm.publicliabilityinsurance == 'Yes' ? 'selected' : ''}>Yes</option>
					<option value="No" ${providerForm.publicliabilityinsurance == 'No' ? 'selected' : ''}>No</option>
					<option value="N/A" ${providerForm.publicliabilityinsurance == 'N/A' ? 'selected' : ''}>N/A (Crown/NHS Indemnity)</option>
				</select><br><br>

				<div id="publicliabilityinsuranceYes" style="display: none;">
					<label>a.i. Name of provider:</label><br>
					<input type="text" class="form-control" id="nameofprovider" name="nameofprovider" value="${providerForm.nameofprovider}" readonly><br>

					<label>a.ii. Expiry date:</label><br>
					<input type="text" class="form-control" id="expirydate" name="expirydate" value="${providerForm.expirydate}" readonly><br>
				</div>

				<div id="publicliabilityinsuranceNo" style="display: none;">
					<label>a.i. What will happen if a member of the public makes a claim:</label><br>
					<input type="text" class="form-control" id="publicclaim" name="publicclaim" value="${providerForm.publicclaim}" readonly><br>
				</div>

				<label>b. UK providers only: Does your organisation hold Employer’s Liability Insurance or equivalent?
					<br>
					This is usually a legal requirement for employing a placement student
				</label><br>
				<select class="form-control" id="employersliabilityinsurance" name="employersliabilityinsurance" disabled>
					<option value=""></option>
					<option value="Yes" ${providerForm.employersliabilityinsurance == 'Yes' ? 'selected' : ''}>Yes</option>
					<option value="No" ${providerForm.employersliabilityinsurance == 'No' ? 'selected' : ''}>No</option>
				</select><br><br>

				<div id="employersliabilityinsuranceYes" style="display: none;">
					<label>b.i. Name of provider:</label><br>
					<input type="text" class="form-control" id="employernameofprovider" name="employernameofprovider" value="${providerForm.employernameofprovider}" readonly><br>

					<label>b.ii. Expiry date:</label><br>
					<input type="text" class="form-control" id="employerexpirydate" name="employerexpirydate" value="${providerForm.employerexpirydate}" readonly><br>
				</div>

				<div id="employersliabilityinsuranceNo" style="display: none;">
					<label>b.i. what will happen if the placement student becomes ill or injured due to the work they complete on placement with you?</label><br>
					<input type="text" class="form-control" id="illorinjured" name="illorinjured" value="${providerForm.illorinjured}" readonly><br>
				</div>

				<label>c. UK providers only: Does your organisation hold Professional Indemnity Insurance or equivalent?
					<br>
					This insurance is only applicable if during the placement a student may provide advice, designs,
					or professional services to the public or other businesses.
				</label><br>
				<select class="form-control" id="professionalindemnityinsurance" name="professionalindemnityinsurance" disabled>
					<option value=""></option>
					<option value="Yes" ${providerForm.professionalindemnityinsurance == 'Yes' ? 'selected' : ''}>Yes</option>
					<option value="No" ${providerForm.professionalindemnityinsurance == 'No' ? 'selected' : ''}>No, but the placement student will provide advice, designs, or professional services to people outside the business.</option>
					<option value="No,N/A" ${providerForm.professionalindemnityinsurance == 'No,N/A' ? 'selected' : ''}>No, this insurance is not applicable to the role/company</option>
				</select><br><br>

				<div id="professionalindemnityinsuranceYes" style="display: none;">
					<label>c.i. Name of provider:</label><br>
					<input type="text" class="form-control" id="professionalnameofprovider" name="professionalnameofprovider" value="${providerForm.professionalnameofprovider}" readonly><br>

					<label>c.ii. Expiry date:</label><br>
					<input type="text" class="form-control" id="professionalexpirydate" name="professionalexpirydate" value="${providerForm.professionalexpirydate}" readonly><br>
				</div>
			</div>


			<div id="nonUkQuestions" style="display: none;">
				<h2>11.	Policies and Insurance (Overseas Employers Only)</h2>
				<label>a. Non-UK providers only: Would your organisation’s insurances cover liability if your
					business is held responsible for injury or damage to a client, contractor, or member of
					the public?
				</label><br>
				<select class="form-control" id="injuryordamage" name="injuryordamage" disabled>
					<option value=""></option>
					<option value="Yes" ${providerForm.injuryordamage == 'Yes' ? 'selected' : ''}>Yes</option>
					<option value="No" ${providerForm.injuryordamage == 'No' ? 'selected' : ''}>No</option>
				</select><br><br>

				<div id="injuryordamageYes" style="display: none;">
					<label>a.i. Name of provider:</label><br>
					<input type="text" class="form-control" id="injuryordamagenameofprovider" name="injuryordamagenameofprovider" value="${providerForm.injuryordamagenameofprovider}" readonly><br>

					<label>a.ii. Expiry date:</label><br>
					<input type="text" class="form-control" id="injuryordamageexpirydate" name="injuryordamageexpirydate" value="${providerForm.injuryordamageexpirydate}" readonly><br>
				</div>

				<label>b. Non-UK providers only: Would your organisation’s insurances cover liability arising
					from injury sustained by a student as a result of their duties in the role?
				</label><br>
				<select class="form-control" id="injuriesinrole" name="injuriesinrole" disabled>
					<option value=""></option>
					<option value="Yes" ${providerForm.injuriesinrole == 'Yes' ? 'selected' : ''}>Yes</option>
					<option value="No" ${providerForm.injuriesinrole == 'No' ? 'selected' : ''}>No</option>
				</select><br><br>

				<div id="injuriesinroleYes" style="display: none;">
					<label>b.i. Name of provider:</label><br>
					<input type="text" class="form-control" id="injuriesinrolenameofprovider" name="injuriesinrolenameofprovider" value="${providerForm.injuriesinrolenameofprovider}" readonly><br>

					<label>b.ii. Expiry date:</label><br>
					<input type="text" class="form-control" id="injuriesinroleexpirydate" name="injuriesinroleexpirydate" value="${providerForm.injuriesinroleexpirydate}" readonly><br>
				</div>

				<label>c. Non-UK providers only: Would your organisation’s insurances cover any legal/compensation
					costs arising from the placement student’s advice or professional services?
				</label><br>
				<select class="form-control" id="legalorcompensation" name="legalorcompensation" disabled>
					<option value=""></option>
					<option value="Yes" ${providerForm.legalorcompensation == 'Yes' ? 'selected' : ''}>Yes</option>
					<option value="No" ${providerForm.legalorcompensation == 'No' ? 'selected' : ''}>No, but the student will be providing external advice or professional services in their role</option>
					<option value="No,N/A" ${providerForm.legalorcompensation == 'No,N/A' ? 'selected' : ''}>No, but the student will not be providing any external advice or professional services</option>
				</select><br><br>

				<div id="legalorcompensationYes" style="display: none;">
					<label>c.i. Name of provider:</label><br>
					<input type="text" class="form-control" id="legalorcompensationnameofprovider" name="legalorcompensationnameofprovider" value="${providerForm.legalorcompensationnameofprovider}" readonly><br>

					<label>c.ii. Expiry date:</label><br>
					<input type="text" class="form-control" id="legalorcompensationexpirydate" name="legalorcompensationexpirydate" value="${providerForm.legalorcompensationexpirydate}" readonly><br>
				</div>
			</div>


			<h2>12.	Health and Safety</h2>
			<label>a. Does the organisation have a procedure for recording and reporting accidents/incidents?</label><br>
			<select class="form-control" id="reportingaccidents" name="reportingaccidents" disabled>
				<option value=""></option>
				<option value="Yes" ${providerForm.reportingaccidents == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${providerForm.reportingaccidents == 'No' ? 'selected' : ''}>No</option>
			</select><br>

			<label>b. Does the organisation have a written health and safety policy?</label><br>
			<select class="form-control" id="healthandsafetypolicy" name="healthandsafetypolicy" disabled>
				<option value=""></option>
				<option value="Yes" ${providerForm.healthandsafetypolicy == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${providerForm.healthandsafetypolicy == 'No' ? 'selected' : ''}>No</option>
			</select><br>

			<label>c. Does the organisation provide health and safety training for new employees?</label><br>
			<select class="form-control" id="healthandsafetytraining" name="healthandsafetytraining" disabled>
				<option value=""></option>
				<option value="Yes" ${providerForm.healthandsafetytraining == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${providerForm.healthandsafetytraining == 'No' ? 'selected' : ''}>No</option>
			</select><br>


			<h2>13. University Access and Support</h2>
			<label>a. Will staff from the University be able to undertake site visits during the
				placement as required in consultation with appropriate staff at your organisation?
			</label><br>
			<select class="form-control" id="sitevisits" name="sitevisits" disabled>
				<option value=""></option>
				<option value="Yes" ${providerForm.sitevisits == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${providerForm.sitevisits == 'No' ? 'selected' : ''}>No</option>
			</select><br>

			<div id="sitevisitsReasons" style="display: none;">
				<label>a.i. Please provide reasons:</label><br>
				<input type="text" class="form-control" id="reasons" name="reasons" value="${providerForm.reasons}" readonly><br>
			</div>

			<label>b. Are there any issues relating to confidentiality or disclosure which the
				University will need to take into account in its procedures for assessing work
				undertaken by students on placement in your organisation?
			</label><br>
			<select class="form-control" id="confidentialityordisclosure" name="confidentialityordisclosure" disabled>
				<option value=""></option>
				<option value="Yes" ${providerForm.confidentialityordisclosure == 'Yes' ? 'selected' : ''}>Yes</option>
				<option value="No" ${providerForm.confidentialityordisclosure == 'No' ? 'selected' : ''}>No</option>
			</select><br>

			<div id="confidentialityordisclosureDetails" style="display: none;">
				<label>a.i. Please provide details:</label><br>
				<input type="text" class="form-control" id="detailsofconfidentialityordisclosure" name="detailsofconfidentialityordisclosure" value="${providerForm.detailsofconfidentialityordisclosure}" readonly><br>
			</div>


			<h2>14. Declaration and Signature</h2>
			<p1>By completing this form you have accepted the conditions and requirements set out in the
				Responsibilities of the Placement Provider on page one of this document. You also confirm
				all the information provided in this form is factually correct at the time of submitting<br><br>
			</p1>
			<label>Name:</label><br>
			<input type="text" class="form-control" id="name" name="name" value="${providerForm.name}" readonly><br>

			<label>Job Title:</label><br>
			<input type="text" class="form-control" id="declarationjobtitle" name="declarationjobtitle" value="${providerForm.declarationjobtitle}" readonly><br>

			<label>Signature:</label><br>
			<input type="text" class="form-control" id="signature" name="signature" value="${providerForm.signature}" readonly><br>

			<label>Date:</label><br>
			<input type="date" class="form-control" id="date" name="date" value="${providerForm.date}" readonly><br>


		</form>
	</section>
</main>
<script>
	function checkPostcode() {
		const postcode = document.getElementById('postcode').value;
		const ukPostcodePattern = /^(GIR ?0AA|[A-Z]{1,2}\d{1,2} ?\d[A-Z]{2}|[A-Z]{1,2}\d[A-Z] ?\d[A-Z]{2}|[A-Z]{1,2}\d{1,2}[A-Z] ?\d[A-Z]{2})$/i;
		const ukQuestions = document.getElementById('ukQuestions');
		const nonUkQuestions = document.getElementById('nonUkQuestions');
		if (ukPostcodePattern.test(postcode)) {
			ukQuestions.style.display = 'block';
			nonUkQuestions.style.display = 'none';
		} else {
			ukQuestions.style.display = 'none';
			nonUkQuestions.style.display = 'block';
		}
	}

	const activity = document.getElementById('activity');
	const activityDetails = document.getElementById('activityDetails');

	if (activity.value === 'Yes') {
		activityDetails.style.display = 'block';
	}

	// Add event listener to the select element
	activity.addEventListener('change', function() {
		if (this.value === 'Yes') {
			activityDetails.style.display = 'block';
		} else {
			activityDetails.style.display = 'none';
		}
	});

	const probationPeriodSelect = document.getElementById('probationperiod');
	const probationPeriodAssessement = document.getElementById('probationPeriodAssessement');

	if (probationPeriodSelect.value === 'Yes') {
		probationPeriodAssessement.style.display = 'block';
	}

	probationPeriodSelect.addEventListener('change', function() {
		if (this.value === 'Yes') {
			probationPeriodAssessement.style.display = 'block';
		} else {
			probationPeriodAssessement.style.display = 'none';
		}
	});

	const hazardsorrisks = document.getElementById('hazardsorrisks');
	const detailsOfRisks = document.getElementById('detailsOfRisks');

	if (hazardsorrisks.value === 'Yes') {
		detailsOfRisks.style.display = 'block';
	}

	hazardsorrisks.addEventListener('change', function() {
		if (this.value === 'Yes') {
			detailsOfRisks.style.display = 'block';
		} else {
			detailsOfRisks.style.display = 'none';
		}
	});

	const training = document.getElementById('training');
	const trainingDetailsDiv = document.getElementById('trainingDetails');

	if (training.value === 'Yes') {
		trainingDetailsDiv.style.display = 'block';
	}

	training.addEventListener('change', function() {
		if (this.value === 'Yes') {
			trainingDetailsDiv.style.display = 'block';
		} else {
			trainingDetailsDiv.style.display = 'none';
		}
	});

	const workfromhome = document.getElementById('workfromhome');
	const frequencyOfWorkFromHome = document.getElementById('frequencyOfWorkFromHome');

	if (workfromhome.value === 'Yes') {
		frequencyOfWorkFromHome.style.display = 'block';
	}

	workfromhome.addEventListener('change', function() {
		if (this.value === 'Yes') {
			frequencyOfWorkFromHome.style.display = 'block';
		} else {
			frequencyOfWorkFromHome.style.display = 'none';
		}
	});

	const workingfromdifferentsites = document.getElementById('workingfromdifferentsites');
	const travelDetails = document.getElementById('travelDetails');

	if (workingfromdifferentsites.value === 'Yes') {
		travelDetails.style.display = 'block';
	}

	workingfromdifferentsites.addEventListener('change', function() {
		if (this.value === 'Yes') {
			travelDetails.style.display = 'block';
		} else {
			travelDetails.style.display = 'none';
		}
	});

	const risksatmainlocation = document.getElementById('risksatmainlocation');
	const risksandactionsDetails = document.getElementById('risksandactionsDetails');

	if (risksatmainlocation.value === 'Yes') {
		risksandactionsDetails.style.display = 'block';
	}

	risksatmainlocation.addEventListener('change', function() {
		if (this.value === 'Yes') {
			risksandactionsDetails.style.display = 'block';
		} else {
			risksandactionsDetails.style.display = 'none';
		}
	});

	const precautionarymeasures = document.getElementById('precautionarymeasures');
	const precautionarymeasuresDetails = document.getElementById('precautionarymeasuresDetails');

	if (precautionarymeasures.value === 'Yes') {
		precautionarymeasuresDetails.style.display = 'block';
	}

	precautionarymeasures.addEventListener('change', function() {
		if (this.value === 'Yes') {
			precautionarymeasuresDetails.style.display = 'block';
		} else {
			precautionarymeasuresDetails.style.display = 'none';
		}
	});

	const publicliabilityinsurance = document.getElementById('publicliabilityinsurance');
	const publicliabilityinsuranceYes = document.getElementById('publicliabilityinsuranceYes');
	const publicliabilityinsuranceNo = document.getElementById('publicliabilityinsuranceNo');

	if (publicliabilityinsurance.value === 'Yes') {
		publicliabilityinsuranceYes.style.display = 'block';
	} else if (publicliabilityinsurance.value === 'No') {
		publicliabilityinsuranceNo.style.display = 'block';
	}

	publicliabilityinsurance.addEventListener('change', function() {
		if (this.value === 'Yes') {
			publicliabilityinsuranceYes.style.display = 'block';
			publicliabilityinsuranceNo.style.display = 'none';
		} else if(this.value === 'No'){
			publicliabilityinsuranceNo.style.display = 'block';
			publicliabilityinsuranceYes.style.display = 'none';
		}else{
			publicliabilityinsuranceNo.style.display = 'none';
			publicliabilityinsuranceYes.style.display = 'none';
		}
	});

	const employersliabilityinsurance = document.getElementById('employersliabilityinsurance');
	const employersliabilityinsuranceYes = document.getElementById('employersliabilityinsuranceYes');
	const employersliabilityinsuranceNo = document.getElementById('employersliabilityinsuranceNo');

	if (employersliabilityinsurance.value === 'Yes') {
		employersliabilityinsuranceYes.style.display = 'block';
	} else if (employersliabilityinsurance.value === 'No') {
		employersliabilityinsuranceNo.style.display = 'block';
	}

	employersliabilityinsurance.addEventListener('change', function() {
		if (this.value === 'Yes') {
			employersliabilityinsuranceYes.style.display = 'block';
			employersliabilityinsuranceNo.style.display = 'none';
		} else if(this.value === 'No'){
			employersliabilityinsuranceNo.style.display = 'block';
			employersliabilityinsuranceYes.style.display = 'none';
		}else{
			employersliabilityinsuranceYes.style.display = 'none';
			employersliabilityinsuranceNo.style.display = 'none';
		}
	});

	const professionalindemnityinsurance = document.getElementById('professionalindemnityinsurance');
	const professionalindemnityinsuranceYes = document.getElementById('professionalindemnityinsuranceYes');

	if (professionalindemnityinsurance.value === 'Yes') {
		professionalindemnityinsuranceYes.style.display = 'block';
	}

	professionalindemnityinsurance.addEventListener('change', function() {
		if (this.value === 'Yes') {
			professionalindemnityinsuranceYes.style.display = 'block';
		} else {
			professionalindemnityinsuranceYes.style.display = 'none';
		}
	});

	const injuryordamage = document.getElementById('injuryordamage');
	const injuryordamageYes = document.getElementById('injuryordamageYes');

	if (injuryordamage.value === 'Yes') {
		injuryordamageYes.style.display = 'block';
	}

	injuryordamage.addEventListener('change', function() {
		if (this.value === 'Yes') {
			injuryordamageYes.style.display = 'block';
		} else {
			injuryordamageYes.style.display = 'none';
		}
	});

	const injuriesinrole = document.getElementById('injuriesinrole');
	const injuriesinroleYes = document.getElementById('injuriesinroleYes');

	if (injuriesinrole.value === 'Yes') {
		injuriesinroleYes.style.display = 'block';
	}

	injuriesinrole.addEventListener('change', function() {
		if (this.value === 'Yes') {
			injuriesinroleYes.style.display = 'block';
		} else {
			injuriesinroleYes.style.display = 'none';
		}
	});

	const legalorcompensation = document.getElementById('legalorcompensation');
	const legalorcompensationYes = document.getElementById('legalorcompensationYes');

	if (legalorcompensation.value === 'Yes') {
		legalorcompensationYes.style.display = 'block';
	}

	legalorcompensation.addEventListener('change', function() {
		if (this.value === 'Yes') {
			legalorcompensationYes.style.display = 'block';
		} else {
			legalorcompensationYes.style.display = 'none';
		}
	});

	const sitevisits = document.getElementById('sitevisits');
	const sitevisitsReasons = document.getElementById('sitevisitsReasons');

	if (sitevisits.value === 'No') {
		sitevisitsReasons.style.display = 'block';
	}

	sitevisits.addEventListener('change', function() {
		if (this.value === 'No') {
			sitevisitsReasons.style.display = 'block';
		} else {
			sitevisitsReasons.style.display = 'none';
		}
	});

	const confidentialityordisclosure = document.getElementById('confidentialityordisclosure');
	const confidentialityordisclosureDetails = document.getElementById('confidentialityordisclosureDetails');

	if (confidentialityordisclosure.value === 'Yes') {
		confidentialityordisclosureDetails.style.display = 'block';
	}

	confidentialityordisclosure.addEventListener('change', function() {
		if (this.value === 'Yes') {
			confidentialityordisclosureDetails.style.display = 'block';
		} else {
			confidentialityordisclosureDetails.style.display = 'none';
		}
	});

</script>
</body>
</html>

