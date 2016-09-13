<cfquery name="news">
	SELECT id, title, story, date_published
	FROM news
	WHERE id = #url.id#
</cfquery>

<cfoutput query="news">
	<h1>
		#news.title# 
		<br><small>#dateFormat(news.date_published, "mmmm d, yyyy")#</small>
	</h1>
	<p>#news.story#</p>
</cfoutput>