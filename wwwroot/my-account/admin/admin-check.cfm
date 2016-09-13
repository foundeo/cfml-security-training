<cfinclude template="../login-check.cfm">
<cfif NOT session.isAdmin>
	Sorry must be an admin.<cfabort>
</cfif>