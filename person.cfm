<cfsetting showdebugoutput="false" />
<cfparam name="url.method" type="string" default="list" />
<cfparam name="url.personID" type="any" default="0" />
<cfparam name="url.orderby" type="string" default="personID asc" />
<cfparam name="url.message" type="string" default="" />
<cfparam name="url.offset" type="numeric" default="0" />
<cfparam name="url.maxresults" type="numeric" default="10" />
<cfparam name="url.q" type="string" default="" />
<cfimport path="hoytstaff.cfc.*" />
<cf_pageWrapper>

<h2>Person</h2>

<cfswitch expression="#url.method#" >

	<cfcase value="list">
		<cfset personArray = application.personService.listPaged(url.offset, url.maxresults, url.orderby ) />
		<cfset totalCount = application.personService.count() />
		<cf_personBreadcrumb method="list"/>
		<cf_personSearch q="#url.q#" />
		<cf_personList orderby="#url.orderby#" personArray = "#personArray#" message="#url.message#" offset="#url.offset#" maxresults="#url.maxresults#" totalCount="#totalCount#" /> 
	</cfcase>

	<cfcase value="searchresult">
		<cfset personArray = application.personService.searchPaged(url.q, url.offset, url.maxresults, url.orderby ) />
		<cfset totalCount = application.personService.searchCount(url.q) />
		<cf_personBreadcrumb method="list"/>
		<cf_personSearch q="#url.q#" />
		<cf_personList method="searchresult" q="#url.q#" orderby="#url.orderby#" personArray = "#personArray#" message="#url.message#" offset="#url.offset#" maxresults="#url.maxresults#"  totalCount="#totalCount#" /> 
	</cfcase>

	<cfcase value="read">
		<cfset person = application.personService.get(url.personID) />
		<cf_personBreadcrumb method="read" person = "#person#"/>
		<cf_personSearch q="#url.q#" />
		<cf_personRead person = "#person#" /> 
	</cfcase>

	<cfcase value="edit">
		<cfif url.personID eq 0>
			<cfset person = New person() />
			<cfset new = true />
		<cfelse>
			<cfset person = application.personService.get(url.personID) />
			<cfset new = false />
		</cfif>
		<cf_personBreadcrumb method="edit" person = "#person#"  new="#new#" /> 

		<cf_personEdit person = "#person#" message="#url.message#" /> 
	</cfcase>

	<cfcase value="clone">
		<cfset ref = application.personService.get(url.personID) />
		<cfset person = entityNew("person") />
		<cfset person.setfirstName(ref.getfirstName())  />
		<cfset person.setlastName(ref.getlastName())  />
		<cfset person.setblog(ref.getblog())  />
		<cfset person.settwitter(ref.gettwitter())  />
		<cfset person.setlocation(ref.getlocation())  />

		<cf_personBreadcrumb method="new" person = "#person#"  new="true" /> 

		<cf_personEdit person = "#person#" message="#url.message#" /> 
	</cfcase>

	<cfcase value="edit_process">
		<cfset person = EntityNew("person") />
		<cfset person = person.populate(form) />
		<cfset application.personService.update(person) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=edit&personID=#person.getpersonID()#&message=updated" />
	</cfcase>

	<cfcase value="delete_process">
			<cfset person = application.personService.get(url.personID) />
		<cfset application.personService.destroy(person) />
		<cfset ORMFlush() />
		<cflocation url ="#cgi.script_name#?method=list&message=deleted" />
	</cfcase>

</cfswitch>
</cf_pageWrapper>