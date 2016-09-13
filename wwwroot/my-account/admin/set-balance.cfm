<cfinclude template="admin-check.cfm">

<cfquery>
	UPDATE users
	SET balance = <cfqueryparam value="#balance#" cfsqltype="cf_sql_decimal">
	WHERE id = <cfqueryparam value="#id#" cfsqltype="cf_sql_integer">
</cfquery>

<div class="alert alert-success">
	Balance updated successfully.
</div>