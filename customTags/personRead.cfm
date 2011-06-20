<!--- personRead.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.person" type="any" />
<cfparam name="attributes.class" type="string" default="readpage" />
<cfset person = attributes.person /> 
<cfoutput>
<table>
	<tbody>
		<tr>
			<th>Personid</th>
			<td>#person.getpersonID()#</td>
		</tr>
		<tr>
			<th>Firstname</th>
			<td>#person.getfirstName()#</td>
		</tr>
		<tr>
			<th>Lastname</th>
			<td>#person.getlastName()#</td>
		</tr>
		<tr>
			<th>Blog</th>
			<td>#person.getblog()#</td>
		</tr>
		<tr>
			<th>Twitter</th>
			<td>#person.gettwitter()#</td>
		</tr>
		<tr>
			<th>Location</th>
			<td>#person.getlocation()#</td>
		</tr>
	</tbody>
</table>
</cfoutput>
</cfprocessingdirective>
<cfexit method="exitTag" />