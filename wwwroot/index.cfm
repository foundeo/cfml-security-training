<div class="jumbotron">
	<h1>Welcome to Bank of Insecurity <br><small>Thankfully not a real bank.</small></h1>
	<div class="lead">
		This application is full of web application vulnerabilities or security holes. It is used for teaching CFML developers about web application security.
	</div>
</div>
<br><br>
<cfoutput>
<h4>Setup Information <small>Some info to make sure you have everything setup</small></h4>
<table class="table">
	<tr>
		<td>Datasource:</td>
		<td>
		<cftry>
			<cfquery>
				SELECT 1 <cfif request.dbType IS "derby"> FROM users</cfif>
			</cfquery>
			<div class="alert alert-success">
				<strong><span class="glyphicon glyphicon-ok"></span> Datasource: #encodeForHTML(application.dsn)# (#encodeForHTML(request.dbType)#) setup successfully.</strong> 
			</div>
			<cfcatch>
				<div class="alert alert-danger">
					<strong>
						<span class="glyphicon glyphicon-warning-sign"></span> Please Setup a MySQL Datasource Named: #encodeForHTML(application.dsn)#
					</strong>
					<p>Error: #encodeForHTML(cfcatch.message)# #encodeForHTML(cfcatch.detail)#</p>
				</div>
			</cfcatch>
		</cftry>
		</td>
	</tr>
	<tr>
		<td>Database:</td>
		<td>
		<cftry>
			<cfquery name="users">
				SELECT username FROM users
			</cfquery>
			<div class="alert alert-success">
				<div class="row">
					<div class="col-sm-8">
						<strong><span class="glyphicon glyphicon-ok"></span> Database setup successfully.</strong> 
					</div>
					<div class="col-sm-4 text-right">
						<a href="tools/reset-database.cfm" class="btn btn-default btn-sm">Rebuild Database</a>
					</div> 
				</div>
			</div>
			<cfcatch>
				<div class="alert alert-danger">
					<strong>
						<span class="glyphicon glyphicon-warning-sign"></span> Running database setup scripts

					</strong>
					<p>Reason: #encodeForHTML(cfcatch.message)#</p>
				</div>
				<cfinclude template="tools/reset-database.cfm">
			</cfcatch>
		</cftry>
		</td>
	</tr>
	<cfif request.dbType IS "mysql">
	<tr>
		<td>MySQL Version:</td>
		<td>
			<cftry>
			<cfquery datasource="#application.dsn#" name="mysql">
				SELECT VERSION() as version
			</cfquery>
			#encodeForHTML(mysql.version)#
			<cfcatch>
				<div class="alert alert-danger">
					<strong><span class="glyphicon glyphicon-warning-sign"></span> Datasource is not MySQL or is not yet setup.</strong>
				</div>
				<p>Error: #encodeForHTML(cfcatch.message)#</p>
			</cfcatch>
		</cftry>
		</td>
	</tr>
	</cfif>
	<tr>
		<td>CFML Engine Version:</td>
		<td>#server.coldfusion.productname# <cfif server.keyExists("lucee")>#server.lucee.version#<cfelse>#server.coldfusion.productversion#</cfif></td>
	</tr>
	<tr>
		<td>Web Root:</td>
		<td>#getDirectoryFromPath(getCurrentTemplatePath())#
	</tr>
	<tr>
		<td>OS:</td>
		<td>#server.os.name# #server.os.version#</td>
	<tr>
	<tr>
		<td>Memory:</td>
		<td>
			<cfset runtime = createObject("java","java.lang.Runtime").getRuntime()>
			<cfset freeMemory = runtime.freeMemory() / 1024 / 1024>
			<cfset totalMemory = runtime.totalMemory() / 1024 / 1024>
			<cfset maxMemory = runtime.maxMemory() / 1024 / 1024>
			<cfset usedMemory = totalMemory-freeMemory>
			<cfset percentUsed = Round( (usedMemory/totalMemory) * 100 )>
			<div class="progress" style="min-height:24px;">
  					<div class="progress-bar <cfif percentUsed GT 80>progress-bar-warning><cfelse>progress-bar-success</cfif>" role="progressbar" aria-valuenow="#int(percentUsed)#" aria-valuemin="0" aria-valuemax="100" style="min-width: 4em;width:#int(percentUsed)#%;">
  						#int(percentUsed)#%
    				</div>
    				
    		</div>
    		#int(usedMemory)#mb in use of #int(totalMemory)#mb allocated (max: #int(maxMemory)#mb)
  </div>
</div>

		</td>
	</tr>

</table>
</cfoutput>