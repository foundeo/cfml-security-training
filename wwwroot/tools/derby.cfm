<cfset request.dbtype = "derby">
<cfif NOT IsDefined("form.admin_password")>
	<h1>Create Derby Datasource and Database</h1>
	<p>Please Enter Your ColdFusion Administrator Password to Install an Apache Derby Datasource</p>
	
	<form method="post" action="derby.cfm">
		<label for="admin_user">ColdFusion Administrator User:</label><br /><small>User must have adminapi access</small><br />
		<input type="text" name="admin_user" value="admin" /><br />
		<label for="admin_password">ColdFusion Administrator Password:</label><br />
		<input type="password" name="admin_password" value=""><br />
		<br />
		<label for="ds">New Datasource Name:</label><br /><small>A datasource will be created using this name.</small><br />
		<input type="text" name="ds" value="bankofinsecurity" />
		
		
		<input type="submit" value="Create Database" />
	</form>
	
	<br />
	
<cfelse>
	<cfparam name="form.admin_user" default="admin">
	<cfparam name="form.admin_password" default="">
	<cfparam name="form.ds" default="bankofinsecurity" type="variablename">
	
	<h3>Authenticating Admin API</h3>
	<cfset loginSuccessful = CreateObject("component","cfide.adminapi.administrator").login(form.admin_password, form.admin_user)>
	<cfif loginSuccessful>
		<div class="alert alert-success">
			CF Admin API Authentication Successful
		</div>
		<cfset datasource = CreateObject("component", "cfide.adminapi.datasource")>
		<h3>Checking datasource name</h3>
		<cfset form.ds = ReReplace(form.ds, "[^a-zA-Z0-9_-]", "", "ALL")>
		<cfset verify = datasource.verifyDsn(form.ds, false)>
		<cfif IsBoolean(verify) AND verify>
			<h2>Fail</h2>
			<div class="alert alert-danger">
			A datasource with the specified name already exists.</div><cfabort>
		</cfif>
		
		
		<cfset dbPath = server.coldfusion.rootdir & "/db/" & ReReplace(form.ds, "[^a-zA-Z0-9_-]", "", "ALL")>
		<cfloop condition="#DirectoryExists(dbPath)#">
			<cfset dbPath = dbPath & RandRange(1,100)>
		</cfloop>
		
		<h3>Creating Datasource</h3>

		<cfset datasource.setDerbyEmbedded(
				name=form.ds,
						database=dbPath,
						isnewdb=true,
						select=true,
						update=true,
						insert=true,
						delete=true,
						create=true,
						grant=true,
						drop=true,
						revoke=true,
						alter=true,
						storedproc=false,
						description="CFML Security Training"
							)>
		<div class="alert alert-success">					
		<cfoutput>Created Datasource Named: #encodeForHTML(form.ds)#</cfoutput>

		<cfset verify = datasource.verifyDsn(form.ds, true)>
		<cfoutput>Verified: #encodeForHTML(verify)#</cfoutput>
		</div>	

		<h3>Populating Tables</h3>
		<cfinclude template="reset-database.cfm">
		
		
		<div class="alert alert-success"><strong>Database Setup Successfully</strong></div>
		
	<cfelse>
		<p>Invalid ColdFusion Administrator Username or Password.</p>
		<p>Please ensure that the user has access to the adminapi</p>
		<cfabort>
	</cfif>	
</cfif>
