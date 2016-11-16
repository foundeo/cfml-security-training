<cfquery>
INSERT INTO contact (name, subject, message, date_posted)
VALUES (
	<cfqueryparam value="#form.name#">,
	<cfqueryparam value="#form.subject#">,
	<cfqueryparam value="#form.message#">,
	<cfqueryparam value="#dateConvert("local2utc", now())#" cfsqltype="cf_sql_timestamp">
)
</cfquery>

<div class="alert alert-success">Thanks for contacting us!</div>