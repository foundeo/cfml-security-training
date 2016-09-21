<!---
	Don't worry I'm using "accept" for "security"
--->
<cftry>
<cffile action="upload" 
			accept="image/jpg,image/png,image/jpeg" 
			filefield="photo" 
			strict="false"
			destination="#ExpandPath("./photos/")#" 
			nameconflict="overwrite">


<!---
<cfif NOT listFindNoCase("jpg,png,jpeg,gif", cffile.serverFileExt)>
	<cfset fileDelete(cffile.serverDirectory & "/" & cffile.serverFile)>
	<cfthrow message="Sorry invalid file extension!">
</cfif>
--->

<h1>Thanks!</h1>

<cfoutput>
<div class="alert alert-success"><span class="glyphicon glyphicon-ok"></span> &quot;Photo&quot; Uploaded Successfully <a href="/my-account/photos/#cffile.serverFile#">View</a></div>
</cfoutput>
<!--- TODO make sure username is unique --->
<cfquery>
	INSERT INTO users (username, password, photo, balance, date_created)
	VALUES (
		<cfqueryparam value="#form.username#">,
		<cfqueryparam value="#form.password#">,
		<cfqueryparam value="#cffile.serverFile#">,
		0,
		UTC_TIMESTAMP()
	)
</cfquery>


<div class="alert alert-success">Your account has been setup, thanks! Please make a deposit.</div>
<cfcatch>
	<h2>Sorry <small>Registration Incomplete</small></h2>
	<div class="alert alert-danger"><cfoutput>#cfcatch.message#</cfoutput></div>
	<p><cfoutput>#cfcatch.detail#</cfoutput></p>
</cfcatch>
</cftry>