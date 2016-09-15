<cfquery>
INSERT INTO contact (name, subject, message, date_posted)
VALUES (
	<cfqueryparam value="#form.name#">,
	<cfqueryparam value="#form.subject#">,
	<cfqueryparam value="#form.message#">,
	UTC_TIMESTAMP()
)
</cfquery>

<div class="alert alert-success">Thanks for contacting us!</div>