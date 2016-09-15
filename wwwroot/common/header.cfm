<!doctype html>
<html>
<head>
	<title>Bank of Insecurity</title>
	<link href="/common/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
        	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
			<a class="navbar-brand" href="/">Bank of Insecurity</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li<cfif cgi.script_name contains "/news/"> class="active"</cfif>><a href="/news/">News</a></li>
            <li<cfif cgi.script_name contains "/about/"> class="active"</cfif>><a href="/about/">About</a></li>
            <li<cfif cgi.script_name contains "/contact/"> class="active"</cfif>><a href="/contact/">Contact</a></li>
            <li<cfif cgi.script_name contains "/my-account/"> class="active"</cfif>><a href="/my-account/">My Account</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
        	<li class="dropdown"<cfif cgi.script_name contains "/tools/" OR cgi.script_name contains "/lessons/"> class="active"</cfif>>
				<a href="/lessons/" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Training <span class="caret"></span></a>
	          <ul class="dropdown-menu">
	            <li><a href="/lessons/">Lessons</a></li>
	            <li role="separator" class="divider"></li>
	            <li><a href="/tools/http.cfm">HTTP Requester</a></li>
	            <li><a href="/tools/encoders.cfm">Encoders</a></li>
	            <li role="separator" class="divider"></li>
	            <li><a href="/tools/refind.cfm">reFind</a></li>
	            <li><a href="/tools/rematch.cfm">reMatch</a></li>
	            <li><a href="/tools/rereplace.cfm">reReplace</a></li>
	            <li role="separator" class="divider"></li>
	            <li><a href="/tools/reset-database.cfm">Reset Database</a></li>
	            <li><a href="/tools/reset-code.cfm">Reset Codebase</a></li>
	          </ul>
	        </li>
      	</ul>
        </div>
        
      </div>
</nav><br><br><br><br>

<div id="main" class="container">
<!-- MAIN BODY CONTENT START -->
