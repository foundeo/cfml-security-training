<cfset lessonID = "headers">
<cfoutput>
<div class="panel panel-default">
    <div class="panel-heading" role="tab" id="#lessonID#Heading">
        <h3 class="panel-title">
            <a role="button" data-toggle="collapse" data-parent="##accordion" href="###lessonID#Body" aria-expanded="false" aria-controls="#lessonID#Body">
                Security Headers
            </a>
        </h3>
    </div>
    <div id="#lessonID#Body" class="panel-collapse collapse" role="tabpanel" aria-labelledby="#lessonID#Heading">
        <div class="panel-body">
            <h5>Add a <code>Content-Security-Policy</code> header to mitigate XSS weaknesses.</h5>
            <p>Then test some XSS exploits to make sure they do not work.</p>

            <h5>Add a <code>Strict-Transport-Security</code> header</h5>
            <p>Test over http protocol.</p>

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
                    To set a response header use the <code>&lt;cfheader&gt;</code> tag. In script mode you can use <code>cfheader(name="Header-Name", value="0");</code>
              </div>
            </div>
            <div class="collapse" id="#lessonID#Example">
              <div class="well">
                    
                    
                    
              </div>
            </div>
            

        </div>
    </div>
</div>
</cfoutput>