<cfscript> // FILE: ./config/routes.cfm

	// Use this file to add routes to your application and point the root route to a controller action.
	
	// Don't forget to issue a reload request (e.g. reload=true) after making changes.
	// 		See http://docs.cfwheels.org/docs/routing for more info.
	// Easy url to reset application;
	//	 http://www.mywebsite.com/myapp/rewrite.cfm?controller=wheels&action=wheels&view=routes&type=app?reload=true
	
	mapper()
	
		// see https://groups.google.com/forum/#!searchin/cfwheels/nested$3Dtrue%7Csort:date/cfwheels/oZ7sLl7OMjE/-idP4GtKAQAJ
		// for making nested 
		.resources("users")
		
	    // The following is roughly equivalent to;   .resources("users")
		//     // see https://guides.cfwheels.org/docs/routing
		// 
	    //  .get(	name="newUser", 	pattern="users/new",		to="users##new"   )
    	//  .get(	name="editUser", 	pattern="users/[key]/edit", to="users##edit"  )
	    //  .get(	name="user", 		pattern="users/[key]",		to="users##show"  )
	    //  .patch(	name="user", 		pattern="users/[key]",		to="users##update")
	    //  .put(	name="user", 		pattern="users/[key]",		to="users##update")
	    //  .delete(	name="user", 		pattern="users/[key]",		to="users##delete")
	    //  .post(	name="users", 									to="users##create")
	    //  .get(	name="users", 									to="users##index" )

		// The "wildcard" call below enables automatic mapping of "controller/action" type routes.
		// This way you don't need to explicitly add a route every time you create a new action in a controller.
		.wildcard()

		// The root route below is the one that will be called on your application's home page (e.g. http://127.0.0.1/).
		// You can, for example, change "wheels##wheels" to "home##index" to call the "index" action on the "home" controller instead.
		.root(to="wheels##wheels", method="get")
		
	.end();

</cfscript>      
