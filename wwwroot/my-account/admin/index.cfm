<cfinclude template="admin-check.cfm">
<h2>Bank Admin</h2>

<h3>User Accounts</h3>
<cfquery name="users">
	SELECT id, username, is_admin, balance, photo
	FROM users
</cfquery>

<table class="table table-bordered table-striped">
	<thead>
		<tr>
			<th width="100">User</th>
			<th>&nbsp;</th>
			<th>Account Balance</th>
			<th>Is Admin?</th>
		</tr>
	</thead>
	<tbody>
		<cfoutput query="users">
			<tr>
				<td width="100"><img src="../photos/#users.photo#"></td>
				<td><a href="user.cfm?id=#users.id#">#users.username#</a></td>
				<td>#DollarFormat(users.balance)#</td>
				<td>#YesNoFormat(users.is_admin)#</td>
			</tr>
		</cfoutput>
	</tbody>
</table>

<br><br>
<h3>Messages</h3>

<cfquery name="contact">
	SELECT id, name, subject, message, date_posted
	FROM contact
</cfquery>

<cfif contact.recordcount>
<table class="table table-bordered table-striped">
	<thead>
		<tr>
			<th>Name</th>
			<th>Message</th>
			<th>Date</th>
			<th width="100">&nbsp;</th>
		</tr>
	</thead>
	<tbody>
		<cfoutput query="contact">
			<tr>
				<td>#iif(len(contact.name), de(contact.name), de("Anonymous"))#</td>
				<td><strong>#contact.subject#</strong><br><br>#contact.message#</td>
				<td>#dateTimeFormat(contact.date_posted, "full")#</td>
				<td><a href="delete-message.cfm?id=#contact.id#" class="btn btn-large btn-danger"><span class="glyphicon glyphicon-trash"></span> Delete</a>
			</tr>
		</cfoutput>
	</tbody>
</table>
<cfelse>
<div class="alert alert-info">Sorry - no one has contacted us yet.</div>
</cfif>