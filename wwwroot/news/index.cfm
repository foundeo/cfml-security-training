<cfparam name="url.orderby" default="">
<cfquery name="news">
	SELECT id, title, story, date_published
	FROM news 
	<cfif len(url.orderby)>
		ORDER BY #url.orderby#
	</cfif>
</cfquery>
<div class="pull-right">
	<form class="form-inline" action="search.cfm" method="GET">
  		<div class="form-group">
  			<input type="search" name="search" class="form-control" autocomplete="off">
  		</div>
  		<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span> Search News</button>

  	</form>
</div>
<h2>Latest News</h2>

<cfoutput query="news">
	<div class="panel panel-default">
		<div class="panel-body">
			<h5><a href="story.cfm?id=#news.id#">#news.title#</a> <small>#dateFormat(news.date_published, "mmmm d, yyyy")#</small></h5>
			<p>#left(news.story, 100)#...</p>
  		</div>
	</div>
</cfoutput>

