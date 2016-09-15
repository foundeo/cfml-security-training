<cfset lessonID = "auth">
<cfoutput>
<div class="panel panel-default">
    <div class="panel-heading" role="tab" id="#lessonID#Heading">
        <h3 class="panel-title">
            <a role="button" data-toggle="collapse" data-parent="##accordion" href="###lessonID#Body" aria-expanded="false" aria-controls="#lessonID#Body">
                Authentication &amp; Authorization
            </a>
        </h3>
    </div>
    <div id="#lessonID#Body" class="panel-collapse collapse" role="tabpanel" aria-labelledby="#lessonID#Heading">
        <div class="panel-body">
            <h5>Can you find out what valid user names are?</h5>
            <p>Look at response from login form to figure out if a username exists in the DB or not.</p>

            <h5>Can you use a timing attack to determin if user names are valid?</h5>
            <p>Does the app fail quickly when invalid usernames are used and take longer when checking passwords for valid users?</p>

            <h5>Was the developer careless in how they authorized users?</h5> 
            <p>Find a place where the developer forgot to check for authorized users.</p>

            <h5>Does the remember me feature have weaknesses?</h5>
            <p>You bet, take a look.</p>
            

        </div>
    </div>
</div>
</cfoutput>