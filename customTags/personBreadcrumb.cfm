<!--- personBreadcrumb.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.method" type="string" default="list" />
<cfparam name="attributes.new" type="boolean" default="false" />
<cfparam name="attributes.person" type="any" default="" />
<cfset new = attributes.new />
<cfset person = attributes.person />
<cfset method = attributes.method />

<cfoutput><p class="breadcrumb">
	<a href="index.cfm">Main</a> / 
		<a href="person.cfm?method=list">List</a> /
		<cfif CompareNoCase(method, "read") eq 0>
		<a href="person.cfm?method=edit&amp;personID=#person.getpersonID()#">Edit</a> /
		<a href="person.cfm?method=clone&amp;personID=#person.getpersonID()#&amp;message=clone">Clone</a> /
		</cfif>
		<cfif CompareNoCase(method, "edit") eq 0 and not new>
		<a href="person.cfm?method=read&amp;personID=#person.getpersonID()#">Read</a> /
		<a href="person.cfm?method=clone&amp;personID=#person.getpersonID()#&amp;message=clone">Clone</a> /
		</cfif>
	<a href="person.cfm?method=edit">New</a>
</p></cfoutput>

</cfprocessingdirective>
<cfexit method="exitTag" />