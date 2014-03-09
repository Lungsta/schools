<!-- The tabs -->
<div id="tabs">
	<ul>
	    <li><a href="#tab-dependant">Dependant Details</a></li>
		<li><a href="#tab-application">Appplications</a></li>
		<li><a href="#tab-schools">Schools</a></li>
	</ul>
	<div id="tab-dependant">
	<fieldset><legend>Dependant Details</legend>
		<ol class="property-list applicant">
		
				<g:if test="${applicantInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="applicant.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${applicantInstance}" field="firstName"/></span>
					
				</li>
				</g:if>		
				<g:if test="${applicantInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="applicant.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${applicantInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			</ol>
		</fieldset>
		<br/>		
	</div>
	
	<!--  APPLICATION TAB -->
	<div id="tab-application">
	 <table>
				<thead>
					<tr>
					
						<th><g:message code="application.applicant.label" default="Applicant" /></th>
					
						<g:sortableColumn property="application_date" title="${message(code: 'application.application_date.label', default: 'Applicationdate')}" />
					
						<g:sortableColumn property="grade" title="${message(code: 'application.grade.label', default: 'Grade')}" />
					
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${applicationInstanceList}" status="i" var="applicationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${applicationInstance.id}">${fieldValue(bean: applicationInstance, field: "applicant")}</g:link></td>
					
						<td><g:formatDate date="${applicationInstance.application_date}" /></td>
					
						<td>${fieldValue(bean: applicationInstance, field: "grade")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
	</div>
	
	<div id="tab-schools">
			<p>Extra</p>	
	</div>
</div>
<!--  End tabs -->