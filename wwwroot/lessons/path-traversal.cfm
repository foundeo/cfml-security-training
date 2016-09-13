<cfset lessonID = "pt">
<cfoutput>
<div class="panel panel-default">
    <div class="panel-heading" role="tab" id="#lessonID#Heading">
        <h3 class="panel-title">
            <a role="button" data-toggle="collapse" data-parent="##accordion" href="###lessonID#Body" aria-expanded="false" aria-controls="#lessonID#Body">
                Path Traversal
            </a>
        </h3>
    </div>
    <div id="#lessonID#Body" class="panel-collapse collapse" role="tabpanel" aria-labelledby="#lessonID#Heading">
        <div class="panel-body">
            <h5>Can you find a path traversal vulnerability in the code?</h5>
            <p>Look through the code and see if you can find one.</p>

            <h5>Can you exploit the vulnerability?</h5>
            <p>Try to read a file that a public user should not have access to, for example the <code>/config/master-password.txt</code> file above the web root.</p>

            <h5>Can you execute remote code via this vulnerability?</h5> 
            <p>Hint: yes you can.</p>

            <h5>Can you fix the vulnerability?</h5>
            <p>Test your fix by trying to exploit it again.</p>

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
                    Look at the About page, click on a link.
              </div>
            </div>
            <div class="collapse" id="#lessonID#Example">
              <div class="well">
                    
                    <strong>Show the master-password.txt file</strong><br>
                    
                    <a href="/about/?page=../../../config/master-password.txt">/about/?page=../../../config/master-password.txt</a>

                    
                    
              </div>
            </div>
            

        </div>
    </div>
</div>
</cfoutput>