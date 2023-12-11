<h1>ASCII 0 - 255</h1>
<table id="encoders" class="table table-striped table-bordered table-hover" style="font-size: 90%;">
    <thead>
        <tr>
            <th rowspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
            <th colspan="3" class="success">HTML</th>
            <th colspan="3" class="warning">XML</th>
            <th colspan="2" class="danger">URL</th>
            <th colspan="2" class="info">JS</th>
            <th class="active">CSS</th>
            <th colspan="2">LDAP</th>
        </tr>
        <tr>
            <th class="success">htmlEditFormat</th>
            <th class="success">encodeForHTML</th>
            <th class="success">encodeForHTMLAttribute</th>
            <th class="warning">xmlFormat</th>
            <th class="warning">encodeForXML</th>
            <th class="warning">encodeForXMLAttribute</th>
            <th class="danger">urlEncodedFormat</th>
            <th class="danger">encodeForURL</th>
            <th class="info">jsStringFormat</th>
            <th class="info">encodeForJavascript</th>
            <th class="active">encodeForCSS</th>
            <th class="">encodeForLDAP</th>
            <th class="">encodeForDN</th>
        </tr>
    </thead>
    <tbody>
        <cfloop from="0" to="255" index="variables.index">
        <cfoutput>
        <tr>
            <td>#variables.index# : #chr(variables.index)#</td>
            <td class="success">#replace(htmlEditFormat(chr(variables.index)), "&", "&amp;")#</td>
            <td class="success">#replace(encodeForHTML(chr(variables.index)), "&", "&amp;")#</td>
            <td class="success">#replace(encodeForHTMLAttribute(chr(variables.index)), "&", "&amp;")#</td>
            <td class="warning">#replace(xmlFormat(chr(variables.index)), "&", "&amp;")#</td>
            <td class="warning">#replace(encodeForXML(chr(variables.index)), "&", "&amp;")#</td>
            <td class="warning"><cfif structKeyExists(getFunctionList(), "encodeForXMLAttribute")>#replace(encodeForXMLAttribute(chr(variables.index)), "&", "&amp;")#<cfelse><em>N/A</em></cfif></td>
            <td class="danger">#replace(urlEncodedFormat(chr(variables.index)), "&", "&amp;")#</td>
            <td class="danger">#replace(encodeForURL(chr(variables.index)), "&", "&amp;")#</td>
            <td class="info">#replace(jsStringFormat(chr(variables.index)), "&", "&amp;")#</td>
            <td class="info">#replace(encodeForJavascript(chr(variables.index)), "&", "&amp;")#</td>
            <td class="active">#replace(encodeForCSS(chr(variables.index)), "&", "&amp;")#</td>
            <td class="">#replace(encodeForLDAP(chr(variables.index)), "&", "&amp;")#</td>
            <td class="">#replace(encodeForDN(chr(variables.index)), "&", "&amp;")#</td>
        </tr>
        </cfoutput>
        </cfloop>
    </tbody>
</table>