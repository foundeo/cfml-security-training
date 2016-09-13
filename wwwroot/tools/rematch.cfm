
<style>
	textarea { width: 400px; font-size:x-large; }
	.result, td { font-size:x-large !important;}
</style>
<cfparam name="form.string" default="">
<cfparam name="Form.regex" default="">
<cfparam name="form.nocase" default="0">
<h1>ReMatch(regex, string)</h1>
<form action="rematch.cfm" method="post">
	<cfoutput>
	Regex:<br />
	<textarea name="regex">#encodeForHTML(form.regex)#</textarea>
	<br />
	
	
	String:<br />
	<textarea name="string">#encodeForHTML(form.string)#</textarea>
	<br />
	
	
	<input type="checkbox" value="1" name="nocase" <cfif form.nocase>checked="checked"</cfif> /> NoCase
	
	<br />
	<input type="submit" value="Match" />
	
	</cfoutput>
</form>

<div class="result">
<cfif Len(form.regex)>
	
	<cfif form.nocase>
		<cfset result = ReMatchNoCase(form.regex, form.string)>
	<cfelse>
		<cfset result = ReMatch(form.regex, form.string)>
	</cfif>
	<hr />
	Result:
	<cfdump var="#result#">
</cfif>
</div>
