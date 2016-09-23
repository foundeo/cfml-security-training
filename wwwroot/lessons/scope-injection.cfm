<cfset lessonID = "scopeinjection">
<cfoutput>
<div class="panel panel-default">
    <div class="panel-heading" role="tab" id="#lessonID#Heading">
        <h3 class="panel-title">
            <a role="button" data-toggle="collapse" data-parent="##accordion" href="###lessonID#Body" aria-expanded="false" aria-controls="#lessonID#Body">
                Scope Injection
            </a>
        </h3>
    </div>
    <div id="#lessonID#Body" class="panel-collapse collapse" role="tabpanel" aria-labelledby="#lessonID#Heading">
        <div class="panel-body">
            <h5>Can you use scope injection to show an account balance of any user?</h5>
            <p>For example see if you can get the balance of user <code>dave</code>, user id <code>2</code> without logging in.</p>
            
            <h5>Can you fix the code?</h5>
            

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
                    Start here: <a href="/my-account/account.cfm">/my-account/account.cfm</a>
              </div>
            </div>
            <div class="collapse" id="#lessonID#Example">
              <div class="well">
                    <p>If the <code>session.userID</code> variable is not defined CF will check other scopes, eg <code>url.session.userID</code></p>
                    <a href="/my-account/account.cfm?session.userID=2&session.isLoggedIn=1&session.isAdmin=1&session.username=Hacker"><code>/my-account/account.cfm?session.userID=2&amp;session.isLoggedIn=1&amp;session.isAdmin=1&amp;session.username=Hacker</code></a>
                    
                    <p><strong>To Fix Code</strong></p>
                    <p>Add an <code>onSessionStart</code> in Application.cfc to defualt all session variables and use <code>structKeyExists(session, "userID")</code> to make sure each variable is really in the <code>session</code> scope.</p>
              </div>
            </div>
            

        </div>
    </div>
</div>
</cfoutput>