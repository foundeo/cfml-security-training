<cfparam name="form.xml" default="">
<cfif NOT len(form.xml)>
    <cfsavecontent variable="form.xml"><?xml version="1.0" ?>
        <!DOCTYPE d [
        <!ENTITY xxe SYSTEM "http://httpbin.org/uuid">]>
        <tag>&xxe;</tag>
    </cfsavecontent>
<cfelse>
    <!--- 
        xmlParse(form.xml, false, {allowExternalEntities: false})
    --->
    <cfset data = xmlParse(form.xml)>
    <cfdump var="#data#">
</cfif>

<form method="POST">
    <textarea name="xml" class="form-control"><cfoutput>#encodeForHTML(form.xml)#</cfoutput></textarea>
    <button type="Submit">Parse XML</button>
</form>
