<cfquery name="user">
	SELECT id, username, is_admin, balance
	FROM users
	WHERE id = #url.id#
</cfquery>

<cfoutput>
	
	<div class="pull-right">
		<cfif NOT user.is_admin>
			<a href="make-admin.cfm?id=#user.id#&admin=1" class="btn btn-danger">Make Admin</a>
		<cfelse>
			<a href="make-admin.cfm?id=#user.id#&admin=0" class="btn btn-warning">Revoke Admin</a>
		</cfif>
	</div>
	
	<h2>User: #user.username#</h2>

	<form action="set-balance.cfm" method="POST" class="form form-inline">
		<input type="hidden" name="id" value="#user.id#">
		<input type="text" name="balance" placeholder="Balance" value="#user.balance#" class="form-control">
		<button type="submit" class="form-control btn-success">Set Balance</button>
	</form>

</cfoutput>