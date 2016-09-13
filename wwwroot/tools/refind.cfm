<style>
	textarea { width: 400px; font-size:x-large; }
	.result { font-size:x-large !important;}
</style>
<cfparam name="form.string" default="">
<cfparam name="Form.regex" default="">
<cfparam name="form.sub" default="0">
<cfparam name="form.start" default="1">
<cfparam name="form.nocase" default="0">
<h1>ReFind(regex, string, start, returnSubExpressions)</h1>
<form action="refind.cfm" method="post">
	<cfoutput>
	String:<br />
	<textarea name="string">#encodeForHTML(form.string)#</textarea>
	<br />
	Regex:<br />
	<textarea name="regex">#encodeForHTML(form.regex)#</textarea>
	<br />
	Start:<br/>
	<input type="Text" name="start" value="#form.start#" />
	<br />
	<input type="checkbox" value="1" name="sub" <cfif form.sub>checked="checked"</cfif> /> Return Subexpressions 
	<br /> 
	
	<input type="checkbox" value="1" name="nocase" <cfif form.nocase>checked="checked"</cfif> /> NoCase
	
	<br />
	<input type="submit" value="Find" />
	
	</cfoutput>
</form>

<div class="result">
<cfif Len(form.regex)>
	
	<cfif form.nocase>
		<cfset result = ReFindNoCase(form.regex, form.string, form.start, form.sub)>
	<cfelse>
		<cfset result = ReFind(form.regex, form.string, form.start, form.sub)>
	</cfif>
	<hr />
	Result:
	<cfdump var="#result#">
</cfif>
</div>