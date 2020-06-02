<cfscript> // FILE: ./myapp/config/setting.cfm 

	// Use this file to configure your application.
	// 
	// You can also use the environment specific 
	// files (e.g. /config/production/settings.cfm) to override settings set here.
	
	// Don't forget to issue a reload request (e.g. reload=true) after making changes.
	// 		See http://docs.cfwheels.org/docs/configuration-and-defaults for more info.
	// Easy url to reset application;
	//	 http://www.mywebsite.com/myapp/rewrite.cfm?controller=wheels&action=wheels&view=routes&type=app?reload=true
	
	
	// If you leave these settings commented out, CFWheels will set the 
	//   data source name to the same name as the folder the application resides in.
	//
	set(dataSourceName="myapp_dsn");
	set(dataSourceUserName="myusername");
	set(dataSourcePassword="mypwd");

	set(flashStorage="session");
</cfscript>
