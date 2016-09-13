<!--- remember me cookie checker --->
<cfif isDefined("cookie.remember") AND cookie.remember IS NOT 0>
	<cfquery name="user">
		SELECT id, username, password, is_admin
        FROM users
        WHERE id = #cookie.remember#
	</cfquery>
	<cfif user.recordcount>
		<cfset session.isLoggedIn=true>
		<cfset session.userID=user.id>
		<cfset session.isAdmin = user.is_admin>
		<cfset session.username = user.username>
	</cfif>
</cfif>

<!--- redirect to login if not logged in and not login form --->
<cfif cgi.script_name IS NOT "/my-account/index.cfm">
	<cfif NOT IsDefined("session.isLoggedIn") OR NOT session.isLoggedIn>
		<cflocation url="/my-account/">
	</cfif>
</cfif>