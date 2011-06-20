<!--- personEdit.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.person" type="any" />
<cfparam name="attributes.message" type="string" default="" />
<cfset person = attributes.person /> 
<cfset message = attributes.message /> 
<cfif CompareNoCase(message, "updated") eq 0>
	<p class="alert">Record updated</p>
<cfelse>
	<p></p>
</cfif>
<cfoutput>
<cfform action="?method=edit_process" method="post" format="html" enctype="multipart/form-data">
	<table>
	<tbody>
			<input name="personID" type="hidden" value="#person.getpersonID()#" />
		<tr>
			<th><label for="firstName">Firstname:</label></th>
			<td><input name="firstName" type="text" id="firstName" value="#person.getfirstName()#" /></td>
		</tr>
		<tr>
			<th><label for="lastName">Lastname:</label></th>
			<td><input name="lastName" type="text" id="lastName" value="#person.getlastName()#" /></td>
		</tr>
		<tr>
			<th><label for="blog">Blog:</label></th>
			<td><input name="blog" type="text" id="blog" value="#person.getblog()#" /></td>
		</tr>
		<tr>
			<th><label for="twitter">Twitter:</label></th>
			<td><input name="twitter" type="text" id="twitter" value="#person.gettwitter()#" /></td>
		</tr>
		<tr>
			<th><label for="location">Location:</label></th>
			<td><input name="location" type="text" id="location" value="#person.getlocation()#" /></td>
		</tr>
		<tr>
			<th />
			<td><input name="save" type="submit" value="Save" /></td>
		</tr>
	</tbody>
	</table>
</cfform>
</cfoutput>
</cfprocessingdirective>
<cfexit method="exitTag" />