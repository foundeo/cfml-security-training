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
            <h5>Todo?</h5>
            <p>Yup</p>
            <p>A user can POST to the contact form a hidden image that causes an admin action (such as elevate a user to admin or change a users account balance) to be performed. Need to writeup training content here...

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
                    TODO
              </div>
            </div>
            <div class="collapse" id="#lessonID#Example">
              <div class="well">
                    
                    TODO
                    
              </div>
            </div>
            

        </div>
    </div>
</div>
</cfoutput>