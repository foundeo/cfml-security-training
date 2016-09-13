<div class="jumbotron">
	<h1>Welcome to Bank of Insecurity <small>Thankfully we are not a real bank.</small></h1>
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
				SELECT 1
			</cfquery>
			<div class="alert alert-success">
				<strong><span class="glyphicon glyphicon-ok"></span> Datasource: #encodeForHTML(application.dsn)# setup successfully.</strong> 
			</div>
			<cfcatch>
				<div class="alert alert-danger">
					<strong>
						<span class="glyphicon glyphicon-warning-sign"></span> Please Setup a MySQL Datasource Named: #encodeForHTML(application.dsn)#
					</strong>
					<p>Error: #encodeForHTML(cfcatch.message)#</p>
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
				<strong><span class="glyphicon glyphicon-ok"></span> Database setup successfully.</strong> 
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

</table>
</cfoutput>