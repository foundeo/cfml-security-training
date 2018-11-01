<cfset lessonID = "rce">
<cfoutput>
<div class="panel panel-default">
    <div class="panel-heading" role="tab" id="#lessonID#Heading">
        <h3 class="panel-title">
            <a role="button" data-toggle="collapse" data-parent="##accordion" href="###lessonID#Body" aria-expanded="false" aria-controls="#lessonID#Body">
                Remote Code Execution
            </a>
        </h3>
    </div>
    <div id="#lessonID#Body" class="panel-collapse collapse" role="tabpanel" aria-labelledby="#lessonID#Heading">
        <div class="panel-body">
            <h5>Can you find code that might allow remote code exeuction?</h5>
            
            <h5>Can you run code remotely?</h5>

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
                    Look for <code>Evaluate()</code> 
              </div>
            </div>
            <div class="collapse" id="#lessonID#Example">
              <div class="well">
                    Use the <code>Evaluate</code> in the <a href="/news/story.cfm?id=z">error handler</a>
              </div>
            </div>
            

        </div>
    </div>
</div>
</cfoutput>