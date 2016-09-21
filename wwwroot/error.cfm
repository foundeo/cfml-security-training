<h1>Hey - at least we have an Error Handler!</h1>

<cftry>
	<cfif structKeyExists(exception, "rootCause")>
		<cfset ex = exception.rootCause>
	<cfelse>
		<cfset ex = exception>
	</cfif>	
	<cfoutput>
		<div class="alert alert-danger">#ex.message#</div>
		<p class="lead">#ex.detail#</p>
		<h3>URL Scope <small>Handy Debugging Info</small></h3>

		<cfloop list="#structKeyList(url)#" index="key">
			#key# = #evaluate("url.#key#")#<br>
		</cfloop>
		<hr>
		<pre>#ex.stacktrace#</pre>
		
	</cfoutput>
	<cfdump var="#exception#" expand="false" label="Extended Error Info">
	<cfcatch>
		<h2>Error in Error Handler</h2><cfdump var="#cfcatch#">
	</cfcatch>
</cftry>