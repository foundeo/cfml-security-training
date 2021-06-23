<cfset lessonID = "xss">
<cfoutput>
<div class="panel panel-default">
    <div class="panel-heading" role="tab" id="#lessonID#Heading">
        <h3 class="panel-title">
            <a role="button" data-toggle="collapse" data-parent="##accordion" href="###lessonID#Body" aria-expanded="false" aria-controls="#lessonID#Body">
                Cross Site Scripting (XSS)
            </a>
        </h3>
    </div>
    <div id="#lessonID#Body" class="panel-collapse collapse" role="tabpanel" aria-labelledby="#lessonID#Heading">
        <div class="panel-body">
            <h5>Can you find a XSS vulnerability in the code?</h5>
            <p>Look through the code and see if you can find one (there are multiple).

            <h5>Can you exploit a reflected XSS vulnerability?</h5>
            <p>Try to get the browser to execute some javascript, for example: <code>alert(1)</code> when a victim visits a vulnerably crafted url.</p>

            <h5>Can you find a persistant XSS vulnerability?</h5>
            <p>A persistant XSS attack is one where the vulnerable content is stored in the database and then viewed by users that view the content.</p>

            <h5>Can you fix at least one XSS vulnerability?</h5>
            <p>Variables that may contain untrusted values should always be encoded to prevent XSS execution. After fixing it try to exploit it again.</p>

            <br>
            <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="###lessonID#Hint" aria-expanded="false" aria-controls="#lessonID#Hint">
                Show Hint
            </button>
            <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="###lessonID#Example" aria-expanded="false" aria-controls="#lessonID#Example">
                Show Solutions
            </button>
            <br><br>
            <div class="collapse" id="#lessonID#Hint">
              <div class="well">
                    Try searching for news stories.
              </div>
            </div>
            <div class="collapse" id="#lessonID#Example">
              <div class="well">
                    
                    <strong>Reflected XSS Example: JavaScript Alert</strong><br>
                    <cfsavecontent variable="xss"><script>alert(1)</script></cfsavecontent>
                    <a href="../news/search.cfm?search=#encodeForURL(xss)#">/news/search.cfm?search=#encodeForHTML(xss)#</a>

                    <br>
                    <strong>Reflected XSS Example: Content Manager</strong><br>
                    <cfsavecontent variable="xss"><script>document.getElementById('main').innerHTML='Welcome to my CMS'</script></cfsavecontent>
                    <a href="../news/search.cfm?search=#encodeForURL(xss)#">/news/search.cfm?search=#encodeForHTML(xss)#</a>
                    
                    <br>

                    <strong>Reflected XSS Example: Cookie Alert</strong><br>
                    <cfsavecontent variable="xss"><script>alert(document.cookie)</script></cfsavecontent>
                    <a href="../news/search.cfm?search=#encodeForURL(xss)#">/news/search.cfm?search=#encodeForHTML(xss)#</a>
                    <br>

                    <strong>Reflected XSS Example: Login Form</strong><br>
                    <cfsavecontent variable="xss">
                        </strong></div>
                        <form onsubmit="alert('Not the real login form');" method="POST">
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
                        <script>
                            document.getElementById('search_alert').style.display='none';
                            document.getElementById('search_header').innerText = 'Login';
                        </script>
                        <div style="display:none;">
                    </cfsavecontent>
                    <cfset xss = trim(xss)>
                    <a href="../news/search.cfm?search=#encodeForURL(xss)#">/news/search.cfm?search=#encodeForHTML(xss)#</a>
                    <br>

                    <strong>Persistant XSS</strong>
                    <p>Post a message to the Contact Us form, and then login as <code>pete</code>, an admin to view it.</p>

                    <br>
                    <strong>Fixing XSS</strong>
                    <p>Use the appropriate encoder to fix the XSS vulnerabilities.</p>
                    
              </div>
            </div>
            

        </div>
    </div>
</div>
</cfoutput>