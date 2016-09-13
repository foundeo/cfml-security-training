<cfquery>
	UPDATE users
	SET is_admin = <cfif admin>1<cfelse>0</cfif>
	WHERE id = <cfqueryparam value="#id#" cfsqltype="cf_sql_integer">
</cfquery>
<cflocation url="index.cfm">