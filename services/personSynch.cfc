component implements="CFIDE.AIR.ISyncManager"{

	remote any function fetch(numeric id=0){
		if (arguments.id > 0){
			return application.personService.get(arguments.id);				
		}
		else{
			return application.personService.list();
		}		
	}
	
	remote any function sync(	required array operations, 
                        		required array clientobjects,
                        		array originalobjects = ArrayNew(1))
    {
	writelog("synch called");
		
		var i= 0;
		var conflicts = ArrayNew(1);
		var conflictcount = 1;
		var originalObjectType = "hoytstaff.cfc.person";
	
		for (i=1; i <= ArrayLen(operations); i++ ){
	
			var operation = operations[i];
			var clientobject = clientobjects[i];
			var originalobject = originalobjects[i];
			
			if (operation eq "INSERT" ){
				var obj = ORMGetSession().merge(clientobject);
				EntitySave(obj);
			}
			else{
			
				if (isinstanceOf(originalobject,originalObjectType)){
					var serverobject = EntityLoadByPK("person",originalobject.getpersonID());
				}
				else{
					throw "Original Object is not of type [#originalObjectType#]";   
				}    
				
				if (not isdefined('serverobject')){
					var text="CONFLICT::SERVER OBJECT NOT FOUND, RECORD MAY BE DELETED ALREADY";
					var conflict = New CFIDE.AIR.conflict();
					conflict.clientobject = clientobject;
					conflict.originalobject = originalobject;
					conflict.operation = operation;
					conflicts[conflictcount++] = conflict;
					continue;
				}
				
				var isNotConflict = (SerializeJson(originalobject) eq SerializeJson(serverobject));
				
				if (isNotConflict){
					if (operation eq "UPDATE"){
						obj = ORMGetSession().merge(clientobject);
						EntitySave(obj); 
					}           
					else if (operation eq "DELETE"){
						obj = ORMGetSession().merge(originalobject);
						EntityDelete(obj);
					}
				}
				else{
					var text="is a conflict";
					var conflict = New CFIDE.AIR.conflict();
					conflict.clientobject = clientobject;
					conflict.originalobject = originalobject;
					conflict.operation = operation;
					conflicts[conflictcount++] = conflict;
				continue;
				}
			}
		}
		if (conflictcount gt 1){
			return conflicts;
		}
	}

	

}