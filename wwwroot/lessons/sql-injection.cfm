<cfset lessonID = "sqli">
<cfoutput>
<div class="panel panel-default">
    <div class="panel-heading" role="tab" id="#lessonID#Heading">
        <h3 class="panel-title">
            <a role="button" data-toggle="collapse" data-parent="##accordion" href="###lessonID#Body" aria-expanded="false" aria-controls="#lessonID#Body">
                SQL Injection
            </a>
        </h3>
    </div>
    <div id="#lessonID#Body" class="panel-collapse collapse" role="tabpanel" aria-labelledby="#lessonID#Heading">
        <div class="panel-body">
            <h5>Can you find a SQL Injection vulnerability in the code?</h5>
            <p>Look through the code and see if you can find one (there are multiple).</p>

            <h5>Can you exploit a SQL Injection vulnerability?</h5>
            <p>Try to execute some SQL using just your browser.</p>

            <h5>Can you get a list of username and passwords?</h5> 
            <p>Query the users table.</p>

            <h5>Can you fix at least one SQL Injection vulnerability?</h5>
            <p>Use <code><a href="http://cfdocs.org/cfqueryparam">cfqueryparam</a></code> to fix. Then try to exploit it again.</p>

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
                    Look at the code for <code>/news/story.cfm</code>
                    <br>The <code>UNION</code> SQL statement can be handy.
              </div>
            </div>
            <div class="collapse" id="#lessonID#Example">
              <div class="well">
                    
                    <strong>Show Usernames and passwords from Users table</strong><br>
                    <cfsavecontent variable="x">0 UNION SELECT id, username, password, date_created FROM users</cfsavecontent>
                    <a href="../news/story.cfm?id=#encodeForURL(x)#">/news/story.cfm?id=#encodeForHTML(x)#</a>

                    
                    
              </div>
            </div>
            

        </div>
    </div>
</div>
</cfoutput>