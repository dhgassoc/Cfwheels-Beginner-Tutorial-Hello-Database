<cfscript>						//--- FILE: ..\controllers\Users.cfc ---
component extends="Controller" {

	// see https://guides.cfwheels.org/docs/beginner-tutorial-hello-database
	
	// a "Controller" takes an incoming request and, 
	// based on the parameters in the URL, 
	// decides what (if any) 
	// data to get from the model (which in most cases means your database), 
	// and decides which view (which in most cases means 
	// a CFML file producing HTML output) to display to the user.

	function config(){
		}

	   
	   // To execute this function, run the URL at 
	   //    http://localhost/users/new
    function new() {
		
		// As it turns out, our controller needs to provide the view
		// with a blank user object (whose instance variable will also 
		// be called user in this case). In our new action, 
		// we will use the model() function
		// to generate a new instance of the user model.
		//
		// To get a blank set of properties in the model, we'll also 
		// call the generated model's new() method.
		
		// The convention: database tables are plural and 
		// their corresponding CFWheels models are singular.
		//
		// Why is our model name singular instead of plural? 
		// When we're talking about a single record in the users database, 
		// we represent that with an individual model object. So the 
		// users table contains many user objects. 

    	// We're talking about the users database table when we instantiate a user model.
		
        user = model("user").new();
		
		// now cfwheels will default to automatically load ./views/users/new.cfm
    	}	
    
	
	// When the ./views/users/new.cfm form is submitted, 
	//  we have instructed Wheels, via the startFormTag() route, 
	//  to call the model object's create("post") method 
	//  to save the new user to the database.
	function create() {
			// Create a new user and save it to the database
		
			/* NOTE: change code below to "if ( true ) "  
			** if you want to keep it simple as described in  
			**   "Handling the Form Submission" Guide.
			*/
			/* 
			** OR change code below to "if ( false ) " 
			** if you want to use the longer version 
			** with more detailed error reporting,.
			*/
			
		if ( false ) {   
			
			// *********** create() **********	
			
			/* Because we used the objectName argument in the fields of our form, 
			** we can access the user data as a struct in the params struct. 
			*/
			user = model("user").create(params.user);
			
		} else {

			// OR 
			// Fill in new receipt record with data from form,
			// With more detailed error reporting...
			
			local.myStruct  = {};
			local.myStruct.ParamsData= params;
			local.myStruct.errorFlagOnSave = false;
			
			
			// ***********  new()				**********	
			user = model("user").new(params.user);
			
				/* Check to see if everything validated (see "Object Validation" Guide)
				/* then send user to success message
				*/
				
			// ***********  hasErrors()			**********	
			if ( user.hasErrors() )  {
				
				/* There were errors with the form submission, 
				**   show the form again with errors.
				*/
				flashInsert(error="ERROR~92: There was an error validating your data.");
				renderView(action="new");   
			}

			// If everything validated, then save data to database

			
			// **********  save()  form data to database **********	
			 local.myStruct.errorFlagOnSave  = user.save();		
			 	
			// **********  errorFlagOnSave ? 		**********	
			if (  local.myStruct.errorFlagOnSave ) 
			  {
				/* There were errors with the form submission, 
				/*		show the form again with errors;
				*/
				// local.myStruct.ErrorMsg= "DEBUG-106: errorFlagOnSave: There was an error with saving your record."
				// local.myStruct.RetErrorStr= serializeJson( local.myStruct );
				// flashInsert(error= local.myStruct.RetErrorStr);
		
				// Redirect back to the page the user came from.
				redirectTo(back=true);
			}
			else if (  user.hasErrors() ) 
			  {
				/* There were errors with the form submission, 
				**		so show the form again with errors.
				*/
				// local.myStruct.ErrorMsg= "ERROR-118: user.hasErrors() : There was an error with saving your record."
				// local.myStruct.RetErrorStr= serializeJson( local.myStruct );
				// flashInsert(error= local.myStruct.RetErrorStr);
				
				// Redirect to ./views/users/new.cfm
				renderView(action="new");
			}
			else{
				// ********** SAVED successfully **********	
				
				// so send user success message
				flashInsert(success="SUCCESS-128: user record saved to database.");
				

				/* Redirects the user to the users index route 
				**  using the redirectTo() function. 
				**
				**  Redirect to ./views/users/index.cfm
				*/				
				redirectTo(
					route="user",
					success="user created successfully.");
			}      	
		
			
			
			/* Redirects the user to the users index route 
			**  using the redirectTo() function. 
			** We'll use this action to 
			**  list all users in the system with "Edit" links.
			*/
			redirectTo(
				route="users",
				success="User created successfully."
				);
				
		} // of if (true) 
		
	} // of create() 
	
	
	
		/* We'll use this action to list all users in the system 
		** with "Edit" and "Delete" links.
		**
		** To execute this function, run the URL at 
		**    http://localhost/users
		*/
	function index() {
				
		/* This call to the model's findAll() method will return 
		** a query object of all users in the system. 
		** By using the method's order argument, we're also telling the database 
		** to order the records by username.
		*/
		
		users = model("user").findAll(order="username");

		
		// now cfwheels will default to automatically load;
		//	 ./views/users/index.cfm
		}



		/* In the /form/index.cfm,  you probably noticed 
		** that we have an "Edit" button {aka action} for editing users. 
		*/
	function edit() {
		
		/* This action expects a "key" parameter as well which is passed in the URL by default.
		** 
		**  Because we specified "key=users.id" in the linkTo() form helper
		**  in our /form/index.cfm, 
		** we can access the user data as a struct in the params struct. 
		*/
			
		/* Get a single 'user' object as specified by the params.key,
		** and then update properties based on what is pased in from the URL/form
		*/
		user = model("user").findByKey(params.key);
		
		// now cfwheels will default to automatically load;
		//	 ./views/users/edit.cfm
		}
		
	// When the ./views/users/edit.cfm form is submitted, 
	//  we have instructed Wheels, via the startFormTag() route, 
	//  to call the model object's update("patch") method 
	//  to update the data for a specific user record in the database.		
	function update() {
		
		// Get the'user' object, based on key that was pased in,
		// from the URL/form, via the params struct 
		user = model("user").findByKey(params.key);	
			
		// and then update the 'user' object that was 
		// retrieved from the database 
		// using all the fields passed from the URL/form
		user.update(params.user);
	

			/* Redirects the user to the users edit route 
			**  using the redirectTo() function. 
			**
			** Add a 'success' message using the Flash
			** and send the end user back to the edit form 
			**  in case they want to make more changes.
			*/
		redirectTo(
			route="editUser",
			key=user.id,
			success="User updated successfully."
			);
		}	
		
		
	
		/* In the /form/index.cfm,  you probably noticed 
		** that we have an "Delete" button {aka action} for deleting users. 
		*/
	function delete() {
		
		// Get the'user' object, based on key that was pased in,
		// from the URL/form, via the params struct 
		user = model("user").findByKey(params.key);
		
		// and then delete the 'user' object that was 
		// retrieved from the database 
		user.delete();
	

			/* Redirects the user to the users index route 
			**  using the redirectTo() function. 
			**
			** Add a 'success' message using the Flash
			** and send the end user back to the /form/index.cfm 
			*/	
		redirectTo(
			route="users",
			success="User deleted successfully."
			);
		}		
			

} // of component...
</cfscript>