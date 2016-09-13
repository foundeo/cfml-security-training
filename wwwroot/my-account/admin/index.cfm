<cfinclude template="admin-check.cfm">
<h1>Bank Admin</h1>

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