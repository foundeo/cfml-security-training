<cfparam name="url.id" default="">
<cfparam name="url.month" default="#monthAsString(month(now()))#">
<cfparam name="url.year" default="#year(now())#">
<cfquery name="user">
	SELECT id, username, is_admin, balance
	FROM users
	WHERE id = #url.id#
</cfquery>
<cfdocument format="pdf">
    <cfoutput>
        <h1>#user.username#'s Statement</h1>
        <div align="right">
            <small>#url.month#, #url.year#</small>
        </div>
        <p>Balance: #dollarFormat(user.balance)#</p>

    </cfoutput>
</cfdocument>