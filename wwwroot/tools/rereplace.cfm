
<style>
	textarea { width: 400px; font-size:x-large; }
	.result { font-size:x-large !important;}
</style>
<cfparam name="form.string" default="">
<cfparam name="Form.regex" default="">
<cfparam name="form.sub" default="">
<cfparam name="form.all" default="0">
<cfparam name="form.nocase" default="0">
<h1>ReReplace(string, regex, substitute, all/one)</h1>
<form action="rereplace.cfm" method="post">
	<cfoutput>
	String:<br />
	<textarea name="string">#encodeForHTML(form.string)#</textarea>
	<br />
	Regex:<br />
	<textarea name="regex">#encodeForHTML(form.regex)#</textarea>
	<br />
	Sub:<br />
	<textarea name="sub">#encodeForHTML(form.sub)#</textarea>
	<br />
	<input type="checkbox" value="1" name="all" <cfif form.all>checked="checked"</cfif> /> All 
	<br /> 
	
	<input type="checkbox" value="1" name="nocase" <cfif form.nocase>checked="checked"</cfif> /> NoCase
	
	<br />
	<input type="submit" value="Replace" />
	
	</cfoutput>
</form>

<div class="result">
<cfif Len(form.regex)>
	<cfif form.all>
		<cfset scope = "all">
	<cfelse>
		<cfset scope = "one">
	</cfif>
	<cfif form.nocase>
		<cfset result = ReReplaceNoCase(form.string, form.regex, form.sub, scope)>
	<cfelse>
		<cfset result = ReReplace(form.string, form.regex, form.sub, scope)>
	</cfif>
	<hr />
	Result:
	<cfdump var="#result#">
</cfif>
</div>
