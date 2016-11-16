<cfset dbinfo = structNew()>
<cfdbinfo name="dbinfo.dbs" type="DBNames" datasource="#application.dsn#">
<cfdbinfo name="dbinfo.tables" type="Tables" datasource="#application.dsn#">

<cfdump var="#dbinfo#">
