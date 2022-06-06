
	
<h1>HTTP Requester</h1>
<cfparam name="url.src" default="">
<cfparam name="url.ifmodsince" default="">
<cfparam name="url.method" default="GET">
<cfparam name="url.hName" default="">
<cfparam name="url.hVal" default="">
<form action="http.cfm" method="get">
	<cfoutput>
	<input type="text" name="src" placeholder="URL" size="60" value="#XmlFormat(url.src)#" />
	<select name="method">
		<cfset methods = "GET,POST,HEAD,TRACE,OPTIONS,PROPFIND,PROPGET">
		<cfloop list="#methods#" index="m"><option value="#m#"<cfif m IS url.method> selected="selected"</cfif>>#m#</option></cfloop>
	</select>
	<input type="submit" value="Fetch" />
	<br /><br />
	<input type="text" name="fname" value="" placeholder="Custom Form Field Name"> <small>=</small> 
	<input type="text" name="fval" value="" placeholder="Field Value">
	<select name="fvalEncoded">
		<option value="1" selected="selected">Encoded</option>
		<option value="0">Not Encoded</option>
	</select>
	<br /><br />
	<input type="text" name="hName" placeholder="Custom Header Name" value="#XmlFormat(url.hname)#" /> <small>:</small>
	<input type="text" name="hVal" placeholder="Header Value" value="#XmlFormat(url.hval)#" />
	
	<br /><br />
	
	<input type="text" name="ua" value="" placeholder="Custom User Agent" autocomplete="off" />
	<br /><br />
	<input type="checkbox" name="outputFileContent" value="1"> Output Response as HTML
	</cfoutput>
</form>

<cfif Len(url.src)>
	<cfset tick = GetTickCount()>
	<cfif NOT len(url.ua)>
		<cfset url.ua = "ColdFusion">
	</cfif>

	

	<cfhttp url="#url.src#" method="#url.method#" redirect="false" useragent="#url.ua#">
		<cfif url.method IS "POST"><cfhttpparam name="#url.fname#" value="#url.fval#" type="formfield" encoded="#url.fvalEncoded#"></cfif>
		<cfif Len(url.hName)><cfhttpparam type="header" name="#url.hName#" value="#url.hVal#" ></cfif>
	</cfhttp>
	<cfset tock = GetTickCount()>
	<cfoutput><p>Request Execution Time: #NumberFormat(tock-tick)#ms</p></cfoutput>
	<cfdump var="#cfhttp#">
	
	<cfif StructKeyExists(url, "outputFileContent") AND url.outputFileContent>
		<h1>OUTPUT</h1>
		<hr/>
		<cfoutput>#cfhttp.fileContent#</cfoutput>
		<hr/>
	</cfif>
	
</cfif>
