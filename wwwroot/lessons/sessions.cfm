<cfset lessonID = "sessions">
<cfoutput>
<div class="panel panel-default">
    <div class="panel-heading" role="tab" id="#lessonID#Heading">
        <h3 class="panel-title">
            <a role="button" data-toggle="collapse" data-parent="##accordion" href="###lessonID#Body" aria-expanded="false" aria-controls="#lessonID#Body">
                Sessions &amp; Cookies
            </a>
        </h3>
    </div>
    <div id="#lessonID#Body" class="panel-collapse collapse" role="tabpanel" aria-labelledby="#lessonID#Heading">
        <div class="panel-body">
            <h5>Are session cookies protected?</h5>
            <p>Session identifiers should be kept secret. The cookies should be <code>httpOnly</code> and <code>secure</code> - use the developer tools in your browser.</p>

            <h5>Can you make the session cookies <code>httpOnly</code> and <code>secure</code>?</h5>
            <p>There are a few ways to do this.</p>

            <h5>Are there other cookies that should be protected as well?</h5>
            <p>Look for <code>cfcookie</code> tags.</p>

            <h5>Are session identifiers put in the URL?</h5>
            <p>Look for <code>CFID</code> <code>CFTOKEN</code> or <code>JSESSIONID</code> in the url / addressbar.

            <h5>Can you fix code so it does not put session identifiers in the URL?</h5>
            <p>Look for <code>cflocation</code> tags.</p>

            <h5>Can you implement SessionRotate() and SessionInvlidate() in the code?</h5>


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
                    <strong>Session Cookies:</strong> In Firefox open <em>Developer Tools</em> then click on the <em>Storage</em> tab to view cookies.
              </div>
            </div>
            <div class="collapse" id="#lessonID#Example">
              <div class="well">
                    
                    <strong>Fix Session Cookies</strong><br>
                    
                    <p>In <code>Application.cfc</code> make sure you have 
                    <code>this.sessionCookie.httpOnly=true;</code> and <code>this.sessionCookie.secure=true;</code> (if your site is over HTTPS).</p>

                    <strong>Session Identifiers in URL</strong><br>
                    <p>Make sure all <code>cflocation</code> tags have <code>addtoken="false"</code> set.</p>

                    <strong>Add SessionRotate()</strong>
                    <p>After successful login in <code>/my-account/index.cfm</code> and in <code>/my-account/login-check.cfm</code> for <em>Remember Me</em> logins.</p>

                    <strong>Add SessionInvalidate()</strong>
                    <p>Add after logout: <code>/my-account/logout.cfm</code>
                    
              </div>
            </div>
            

        </div>
    </div>
</div>
</cfoutput>