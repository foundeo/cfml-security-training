<!--- very important make sure they logged in! --->
<cfinclude template="login-check.cfm">
<div class="pull-right">
	<cfif session.isAdmin>
		<a href="admin/" class="btn btn-danger btn-large">Bank Admin</a>
	</cfif>
	<a href="profile.cfm" class="btn btn-default btn-large">Profile</a>
	<a href="logout.cfm" class="btn btn-default btn-large">Logout</a>
</div>
<h1>Hi <cfoutput>#session.username# <small>(Member ID: #session.userID#)</small></cfoutput></h1>
<cfquery name="user">
	SELECT balance FROM users 
	WHERE id = #session.userID#
</cfquery>
<div class="lead">Your current account balance is: <strong><cfoutput>#dollarFormat(user.balance)#</cfoutput></strong></div>
