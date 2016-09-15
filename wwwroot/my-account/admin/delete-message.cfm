<cfquery>
	DELETE FROM contact
	WHERE id = #url.id#
</cfquery>

<cflocation url="index.cfm">