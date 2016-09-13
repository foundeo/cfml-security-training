<cfquery name="news">
	SELECT id, title, story, date_published
	FROM news 
	WHERE title LIKE '%#url.search#%'
	OR story LIKE '%#url.search#%'
</cfquery>
<h2>News Search</h2>
<cfif news.recordcount EQ 0>
	<div class="alert alert-warning">
		Sorry your search for <strong><cfoutput>#url.search#</cfoutput></strong> did not turn up any results.
	</div>
<cfelse>
	<div class="alert alert-success">
		Sorry your search for <strong><cfoutput>#url.search#</cfoutput></strong> yeilded <cfoutput>#news.recordcount#</cfoutput> <cfif news.recordcount EQ 1>story<cfelse>stories.</cfif>
	</div>
	<cfoutput query="news">
		<div class="panel panel-default">
			<div class="panel-body">
				<h5><a href="story.cfm?id=#news.id#">#news.title#</a> <small>#dateFormat(news.date_published, "mmmm d, yyyy")#</small></h5>
				<p>#left(news.story, 100)#...</p>
	  		</div>
		</div>
	</cfoutput>	
</cfif>


