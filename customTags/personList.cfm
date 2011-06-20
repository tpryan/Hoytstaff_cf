<!--- personList.cfm --->
<cfprocessingdirective suppresswhitespace="yes">
<cfparam name="attributes.personArray" type="array" />
<cfparam name="attributes.maxresults" type="numeric" default="-1" />
<cfparam name="attributes.offset" type="numeric" default="-1" />
<cfparam name="attributes.orderby" type="string" default="" />
<cfparam name="attributes.q" type="string" default="" />
<cfparam name="attributes.method" type="string" default="list" />
<cfparam name="attributes.totalCount" type="numeric" default="0" />

<cfset personCount = attributes.totalCount  />
<cfset prevOffset = attributes.offset - attributes.maxresults />
<cfset nextOffset = attributes.offset + attributes.maxresults />
<cfset pages = Ceiling(personCount / attributes.maxresults) />


<cfset message = attributes.message /> 
<cfif CompareNoCase(message, "deleted") eq 0>
	<p class="alert">Record deleted</p>
<cfelseif CompareNoCase(message, "search") eq 0>
	<p class="alert">Results for <em>"<cfoutput>#attributes.q#</cfoutput>"</em></p>
<cfelse>
	<p></p>
</cfif>
<cfoutput>
<table>
	<thead>
		<tr>
			<!--- Header for personID --->
			<cfset personIDascOrDesc = (FindNoCase("personID asc", url.orderby))? "desc" : "asc" />
			<cfset personIDascOrDescIcon = (FindNoCase("personID asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=personID #personIDascOrDesc#&amp;q=#attributes.q#">Personid #personIDascOrDescIcon#</a></th>

			<!--- Header for firstName --->
			<cfset firstNameascOrDesc = (FindNoCase("firstName asc", url.orderby))? "desc" : "asc" />
			<cfset firstNameascOrDescIcon = (FindNoCase("firstName asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=firstName #firstNameascOrDesc#&amp;q=#attributes.q#">Firstname #firstNameascOrDescIcon#</a></th>

			<!--- Header for lastName --->
			<cfset lastNameascOrDesc = (FindNoCase("lastName asc", url.orderby))? "desc" : "asc" />
			<cfset lastNameascOrDescIcon = (FindNoCase("lastName asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=lastName #lastNameascOrDesc#&amp;q=#attributes.q#">Lastname #lastNameascOrDescIcon#</a></th>

			<!--- Header for blog --->
			<cfset blogascOrDesc = (FindNoCase("blog asc", url.orderby))? "desc" : "asc" />
			<cfset blogascOrDescIcon = (FindNoCase("blog asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=blog #blogascOrDesc#&amp;q=#attributes.q#">Blog #blogascOrDescIcon#</a></th>

			<!--- Header for twitter --->
			<cfset twitterascOrDesc = (FindNoCase("twitter asc", url.orderby))? "desc" : "asc" />
			<cfset twitterascOrDescIcon = (FindNoCase("twitter asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=twitter #twitterascOrDesc#&amp;q=#attributes.q#">Twitter #twitterascOrDescIcon#</a></th>

			<!--- Header for location --->
			<cfset locationascOrDesc = (FindNoCase("location asc", url.orderby))? "desc" : "asc" />
			<cfset locationascOrDescIcon = (FindNoCase("location asc", url.orderby))? "&darr;" : "&uarr;" />
			<th><a href="?method=#attributes.method#&amp;offset=#attributes.offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=location #locationascOrDesc#&amp;q=#attributes.q#">Location #locationascOrDescIcon#</a></th>

		</tr>
	</thead>
	<tbody>
	<cfloop index="i" from="1" to="#ArrayLen(attributes.personArray)#">
		<cfset person = attributes.personArray[i] />
		<tr<cfif i mod 2> class="odd"</cfif>>
			<td>#person.getpersonID()#</td>
			<td>#person.getfirstName()#</td>
			<td>#person.getlastName()#</td>
			<td>#person.getblog()#</td>
			<td>#person.gettwitter()#</td>
			<td>#person.getlocation()#</td>
			<td class="crudlink"><a href="person.cfm?method=read&personID=#person.getpersonID()#">Read</a></td>
			<td class="crudlink"><a href="person.cfm?method=edit&personID=#person.getpersonID()#">Edit</a></td>
			<td class="crudlink"><a href="person.cfm?method=delete_process&personID=#person.getpersonID()#" onclick="if (confirm('Are you sure?')) { return true}; return false"">Delete</a></td>
		</tr>
	</cfloop>
<cfif attributes.offset gte 0>
<cfif pages gt 1>
	<tr>
	<td colspan="9">
		<table class="listnav">
			<tr>
				<td class="prev">
					<cfif prevOffset gte 0>
						<a href="?method=#attributes.method#&amp;offset=#prevOffset#&amp;maxresults=#attributes.maxresults#&amp;orderby=#attributes.orderby#&amp;q=#url.q#">&larr; Prev</a>
					</cfif>
				</td>
				<td class="pages">
					<cfloop index="i" from="1" to="#pages#">
						<cfset offset = 0 + ((i -1) * attributes.maxresults) />
						<cfif offset eq attributes.offset>
							#i#
						<cfelse>
							<a href="?method=#attributes.method#&amp;offset=#offset#&amp;maxresults=#attributes.maxresults#&amp;orderby=#attributes.orderby#&amp;q=#url.q#">#i#</a>
						</cfif>
					</cfloop>
				</td>
				<td class="next">
					<cfif nextOffset lt personCount>
					<a href="?method=#attributes.method#&amp;offset=#nextOffset#&amp;maxresults=#attributes.maxresults#&amp;orderby=#attributes.orderby#&amp;q=#url.q#">Next &rarr;<a/>
					</cfif>
				</td>
			</tr>
		</table>
	</td>
	</tr>
</cfif>
	</tbody>
</cfif>
	</cfoutput>
</table>
</cfprocessingdirective>
<cfexit method="exitTag" />