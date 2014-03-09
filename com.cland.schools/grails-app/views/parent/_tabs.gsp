<!-- The tabs -->
<div id="tabs">
	<ul>
	    <li><a href="#tab-mother">Mother Details</a></li>
		<li><a href="#tab-father">Father Details</a></li>
		<li><a href="#tab-guardian">Guardian Details</a></li>
	</ul>
	<div id="tab-mother">
	<fieldset><legend>Mother Details</legend>
		<ol class="property-list parent">
		
				<g:if test="${parentInstance?.firstName1}">
				<li class="fieldcontain">
					<span id="firstName1-label" class="property-label"><g:message code="parent.firstName1.label" default="First Name1" /></span>
					
						<span class="property-value" aria-labelledby="firstName1-label"><g:fieldValue bean="${parentInstance}" field="firstName1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parentInstance?.lastName1}">
				<li class="fieldcontain">
					<span id="lastName1-label" class="property-label"><g:message code="parent.lastName1.label" default="Last Name1" /></span>
					
						<span class="property-value" aria-labelledby="lastName1-label"><g:fieldValue bean="${parentInstance}" field="lastName1"/></span>
					
				</li>
				</g:if>
			</ol>
		</fieldset>
		<br/>		
	</div>
	
	<!--  APPLICATION TAB -->
	<div id="tab-father">
	<fieldset><legend>Father Details</legend>
		<ol class="property-list parent">
		<g:if test="${parentInstance?.firstName2}">
				<li class="fieldcontain">
					<span id="firstName2-label" class="property-label"><g:message code="parent.firstName2.label" default="First Name2" /></span>
					
						<span class="property-value" aria-labelledby="firstName2-label"><g:fieldValue bean="${parentInstance}" field="firstName2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parentInstance?.lastName2}">
				<li class="fieldcontain">
					<span id="lastName2-label" class="property-label"><g:message code="parent.lastName2.label" default="Last Name2" /></span>
					
						<span class="property-value" aria-labelledby="lastName2-label"><g:fieldValue bean="${parentInstance}" field="lastName2"/></span>
					
				</li>
				</g:if>
		</ol>
		</fieldset>
	</div>
	
	<div id="tab-guardian">
			<fieldset><legend>Guardian Details</legend>
		<ol class="property-list parent">
		
				<g:if test="${parentInstance?.firstName3}">
				<li class="fieldcontain">
					<span id="firstName3-label" class="property-label"><g:message code="parent.firstName3.label" default="First Name3" /></span>
					
						<span class="property-value" aria-labelledby="firstName3-label"><g:fieldValue bean="${parentInstance}" field="firstName3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parentInstance?.lastName3}">
				<li class="fieldcontain">
					<span id="lastName3-label" class="property-label"><g:message code="parent.lastName3.label" default="Last Name3" /></span>
					
						<span class="property-value" aria-labelledby="lastName3-label"><g:fieldValue bean="${parentInstance}" field="lastName3"/></span>
					
				</li>
				</g:if>	
		</ol>
		</fieldset>
	</div>
</div>
<!--  End tabs -->