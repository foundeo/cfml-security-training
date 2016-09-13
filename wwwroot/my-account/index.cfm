<cfparam name="form.username" default="">
<cfparam name="form.password" default="">
<cfparam name="form.remember" default="0">
<cfparam name="loginMessage" default="">
<cfif Len(form.username)>
    <!--- do login --->
    <cfquery name="user">
        SELECT id, username, password, is_admin
        FROM users
        WHERE username = <cfqueryparam value="#form.username#">
    </cfquery>
    <cfif user.recordcount EQ 0>
        <cfset loginMessage = "Sorry no such user.">
    <cfelse>
        <!--- for timing attack --->
        <cfset hashedPassword = hash(form.password, "SHA-512", "utf-8", 60000)>
        <cfif user.password IS form.password>
            <cfset session.userID = user.id>
            <cfset session.username = user.username>
            <cfset session.isAdmin = user.is_admin>
            <cfset session.isLoggedIn = true>
            <cfif form.remember>
                <!--- set remember me cookie --->
                <cfcookie name="remember" value="#user.id#">
            <cfelseif structKeyExists(cookie, "remember")>
                <cfcookie name="remember" value="0" expires="now">
            </cfif>
        <cfelse>
            <cfset loginMessage = "Sorry invalid password.">
        </cfif>
    </cfif>
<cfelse>
    <cfinclude template="login-check.cfm">
</cfif>
<cfif structKeyExists(session, "isLoggedIn") AND session.isLoggedIn>
    <cflocation url="account.cfm">
</cfif>
<cfif Len(loginMessage)>
    <div class="alert alert-danger">
        <cfoutput>#loginMessage#</cfoutput>
    </div>
<cfelse>
    <div class="alert alert-info">
        Please login below. Hint: try pete / password2 or dave / letmein
    </div>
</cfif>
<form action="index.cfm" method="POST">
    <div class="form-group">
        <input type="text" class="form-control" id="username" name="username" placeholder="Username">
    </div>
    <div class="form-group">
        
        <input type="password" class="form-control" id="pwd" name="password" placeholder="Password">
    </div>
  
    <div class="checkbox">
        <label>
            <input type="checkbox" name="remember" value="1"> Remember Me
        </label>
    </div>

    <button type="submit" class="btn btn-primary">Login</button>
</form>

<br><br><br>
<hr>

<h3>Want to bank with us? <small>Signup below</small></h3>
<form action="register.cfm" method="POST" enctype="multipart/form-data">
    <div class="form-group">
        
        <input type="text" class="form-control" id="username" name="username" placeholder="Username">
    </div>
    
    <div class="form-group">
        
        <input type="password" class="form-control" id="pwd" name="password" placeholder="Password">
    </div>

    <div class="form-group">
        <label for="photo">Your Photo:</label>
        <input type="file" class="form-control" id="photo" name="photo" placeholder="JPGs only please">
    </div>

    <button type="submit" class="btn btn-default">Register</button>
</form>


