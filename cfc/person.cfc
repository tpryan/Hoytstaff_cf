/* NOTE: Any changes you make to this CFC will be written over if you regenerate the application.*/
component persistent="true"{

	property name="personID" ormtype="integer" type="numeric" fieldtype="id" generator="native";
	property name="firstName" type="string";
	property name="lastName" type="string";
	property name="blog" type="string";
	property name="twitter" type="string";
	property name="location" type="string";

	/**
	* @hint A initialization routine, runs when object is created.
	*/
	remote person function init() {
		return This;
	}

	/**
	* @hint Nullifies blank or zero id's.  Useful for dealing with objects coming back from remoting.
	*/
	public void function nullifyZeroID() {
		if (getpersonID() eq 0 OR getpersonID() eq ""){
			setpersonID(JavaCast("Null", ""));
		}
	}

	/**
	* @hint Populates the content of the object from a form structure.
	*/
	public person function populate(required struct formStruct ) {
		if (StructKeyExists(arguments.formstruct, "personID") AND arguments.formstruct.personID gt 0){

			var item = EntityLoad("person", arguments.formstruct.personID, true);

			if (not isNull(item)){
				This = item;
			}
			else{
				This.setpersonID(arguments.formstruct.personID);
			}
		}

		if (StructKeyExists(arguments.formstruct, "firstName")){
			This.setfirstName(arguments.formstruct.firstName);
		}

		if (StructKeyExists(arguments.formstruct, "lastName")){
			This.setlastName(arguments.formstruct.lastName);
		}

		if (StructKeyExists(arguments.formstruct, "blog")){
			This.setblog(arguments.formstruct.blog);
		}

		if (StructKeyExists(arguments.formstruct, "twitter")){
			This.settwitter(arguments.formstruct.twitter);
		}

		if (StructKeyExists(arguments.formstruct, "location")){
			This.setlocation(arguments.formstruct.location);
		}

		return This;
	}
}