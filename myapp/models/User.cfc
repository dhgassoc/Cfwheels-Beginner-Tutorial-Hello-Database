<cfcomponent extends="Model"><!--- FILE: ..\models\user.cfc --->
 	

	<cffunction name="init">
            
	  	        
	</cffunction>

	<cffunction name="config">
    <cfset table("users") />
	<cfset validatesUniquenessOf(property="username", message="Sorry, that Username is already taken.")  />        
	</cffunction>
</cfcomponent>