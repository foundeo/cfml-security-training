<h2><a href="account.cfm">My Account</a> &raquo; My User Profile</h2>

<cfif structKeyExists(form, "username")>
	<!--- using the cfupdate tag makes my job almost too easy! --->
	<cfupdate datasource="#application.dsn#" tablename="users">
	<cfset session.username = form.username>
	<div class="alert alert-success">Your user account has been updated.</div>
</cfif>
<hr>
<form action="profile.cfm" method="post">
	<cfoutput>
		<input type="hidden" name="id" value="#session.userID#">
		<div class="form-group">
			<label for="username">Username:</label>
	        <input type="text" class="form-control" id="username" name="username" value="#encodeForHTMLAttribute(session.username)#" placeholder="Username">
	    </div>
    </cfoutput>
    <input type="submit" class="btn btn-primary" value="Update Profile">
</form>
