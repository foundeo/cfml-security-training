<cfset lessonID = "csrf">
<cfoutput>
<div class="panel panel-default">
    <div class="panel-heading" role="tab" id="#lessonID#Heading">
        <h3 class="panel-title">
            <a role="button" data-toggle="collapse" data-parent="##accordion" href="###lessonID#Body" aria-expanded="false" aria-controls="#lessonID#Body">
                Cross Site Request Forgery (CSRF)
            </a>
        </h3>
    </div>
    <div id="#lessonID#Body" class="panel-collapse collapse" role="tabpanel" aria-labelledby="#lessonID#Heading">
        <div class="panel-body">
            <h5>Login as an Admin</h5>
            <p>Login to the application as an admin user <code>pete</code> and see what the admin user can do (change account balances, read contact form submissons, grant/revoke admin rights). Then Logout.</p>
            <h5>Can you perform a CSRF Attack to change an account balance?</h5>
            <p>Change the account balance for user <code>dave</code>.</p>

            <h5>Can you perform a CSRF Attack to elevate a user to admin?</h5>
            <p>Make user <code>dave</code> and admin.</p>

            <h5>Can you fix the code so your attack no longer works?</h5>
            
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
                    Post a message to the contact form, then login as an admin to read it.
              </div>
            </div>
            <div class="collapse" id="#lessonID#Example">
              <div class="well">
                    <p>Post a hidden img tag to the contact form then when admin user reads the message it will perform an <strong>authenticated</strong> HTTP request to the img src url, performing an action.</p>

                    <p>Set Dave's balance to $5 million:</p>
                    <pre>&lt;img src="/my-account/admin/set-balance.cfm?id=2&amp;balance=5000000"&gt;</pre>
                    <p>Make Dave an Admin:</p>
                    <pre>&lt;img src="/my-account/admin/make-admin.cfm?id=2&amp;admin=1"&gt;</pre>
                    <br>
                    <p><strong>To Fix Code</strong></p>
                    <p>Consider using <a href="http://cfdocs.org/csrfgeneratetoken"><code>CSRFGenerateToken([key])</code></a> and <a href="http://cfdocs.org/csrfverifytoken"><code>CSRFVerifyToken(token [,key])</code></a>. Also those forms should require POST and use <code>form</code> scope. Additional measures can be added as well.</p>
              </div>
            </div>
            

        </div>
    </div>
</div>
</cfoutput>