/* NOTE: Any changes you make to this CFC will be written over if you regenerate the application.*/
component{


	/**
	* @hint A initialization routine, runs when object is created.
	*/
	remote personService function init() {
		This.table = "person";
		return This;
	}

	/**
	* @hint Returns the count of records in person
	*/
	remote numeric function count() {
		return ormExecuteQuery("select Count(*) from person")[1];
	}

	/**
	* @hint Returns all of the records in person.
	*/
	remote hoytstaff.cfc.person[] function list() {
		return entityLoad("person", {}, "personID asc");
	}

	/**
	* @hint Returns all of the records in person, with paging.
	*/
	remote hoytstaff.cfc.person[] function listPaged(numeric offset ="0" , numeric maxresults ="0" , string orderby ="personID asc" ) {
		var loadArgs = {};
		if (arguments.offset neq 0){
			loadArgs.offset = arguments.offset;
		}
		if (arguments.maxresults neq 0){
			loadArgs.maxresults = arguments.maxresults;
		}
		return entityLoad("person", {}, arguments.orderby, loadArgs);
	}

	/**
	* @hint Returns one record from person.
	*/
	remote hoytstaff.cfc.person function get(required numeric id ) {
		return EntityLoad("person", arguments.id, true);
	}

	/**
	* @hint Updates one record from person.
	*/
	remote void function update(required any person ) {
		arguments.person.nullifyZeroID();
		EntitySave(arguments.person);
	}

	/**
	* @hint Deletes one record from person.
	*/
	remote void function destroy(required any person ) {
		EntityDelete(arguments.person);
	}

	/**
	* @hint Performs search against person.
	*/
	remote hoytstaff.cfc.person[] function search(string q ) {

		var hqlString = "";
		var whereClause = "";
		var params = {};
		hqlString = hqlString & "FROM person";
		if (len(arguments.q) gt 0){
			whereClause  = ListAppend(whereClause, " firstName LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " lastName LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " blog LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " twitter LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " location LIKE '%#arguments.q#%'", "|");
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
			hqlString = hqlString & " ORDER BY personID asc";
		return ormExecuteQuery(hqlString, false, params);
	}

	/**
	* @hint Performs search against person., with paging.
	*/
	remote hoytstaff.cfc.person[] function searchPaged(string q , numeric offset ="0" , numeric maxresults ="0" , string orderby ="personID asc" ) {

		var hqlString = "";
		var whereClause = "";
		var params = {};
		hqlString = hqlString & "FROM person";
		if (arguments.offset neq 0){
			params.offset = arguments.offset;
		}
		if (arguments.maxresults neq 0){
			params.maxresults = arguments.maxresults;
		}
		if (len(arguments.q) gt 0){
			whereClause  = ListAppend(whereClause, " firstName LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " lastName LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " blog LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " twitter LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " location LIKE '%#arguments.q#%'", "|");
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
			hqlString = hqlString & " ORDER BY #arguments.orderby#";
		return ormExecuteQuery(hqlString, false, params);
	}

	/**
	* @hint Determines total number of results of search for paging purposes.
	*/
	remote numeric function searchCount(string q ) {

		var hqlString = "";
		var whereClause = "";
		var params = {};
		hqlString = hqlString & "SELECT count(*) ";
		hqlString = hqlString & "FROM person";
		if (len(arguments.q) gt 0){
			whereClause  = ListAppend(whereClause, " firstName LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " lastName LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " blog LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " twitter LIKE '%#arguments.q#%'", "|");
			whereClause  = ListAppend(whereClause, " location LIKE '%#arguments.q#%'", "|");
			whereClause = Replace(whereClause, "|", " OR ", "all");
		}
		if (len(whereClause) gt 0){
			hqlString = hqlString & " WHERE " & whereClause;
		}
		return ormExecuteQuery(hqlString, false, params)[1];
	}
}