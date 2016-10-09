<cfparam name="request.dbType" default="derby">
<h3>Rebuilding Database</h3>
<cftry>
	<cftry>
		<cfquery>
			DROP TABLE <cfif request.dbType IS "mysql">IF EXISTS</cfif> contact
		</cfquery>
		<cfcatch></cfcatch>
	</cftry>
	<cfif request.dbType IS "mysql">

		<cfquery>
			CREATE TABLE `contact` (
			  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
			  `name` varchar(100) DEFAULT NULL,
			  `subject` varchar(100) DEFAULT NULL,
			  `message` text,
			  `date_posted` datetime DEFAULT NULL,
			  PRIMARY KEY (`id`)
			) ENGINE=InnoDB DEFAULT CHARSET=utf8
		</cfquery>
		<div class="alert alert-success">
			Created <code>contact</code> table.
		</div>
	<cfelseif request.dbType IS "derby">
		<cfquery>
			CREATE TABLE contact (
			  id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
			  name varchar(100),
			  subject varchar(100) ,
			  message LONG VARCHAR,
			  date_posted TIMESTAMP
			)
		</cfquery>
	</cfif>

	<div class="alert alert-success">Created <code>contact</code> table</div>

	<cftry>
		<cfquery>
			DROP TABLE <cfif request.dbType IS "mysql">IF EXISTS</cfif> news
		</cfquery>
		<cfcatch></cfcatch>
	</cftry>

	<cfif request.dbType IS "mysql">
		<cfquery>
			CREATE TABLE `news` (
			  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
			  `title` varchar(100) NOT NULL DEFAULT '',
			  `story` text NOT NULL,
			  `date_published` date DEFAULT NULL,
			  PRIMARY KEY (`id`)
			) ENGINE=InnoDB DEFAULT CHARSET=utf8;
		</cfquery>
	<cfelseif request.dbType IS "derby">
		<cfquery>
			CREATE TABLE news (
			  id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
			  title varchar(100) NOT NULL,
			  story LONG VARCHAR NOT NULL,
			  date_published date
			  
			)
		</cfquery>
	</cfif>

	<cfquery>
	INSERT INTO news (title, story, date_published)
	VALUES
		('Low Interest Savings','We are offering our lowest interest rates ever at 0.0000001% interest who doesnt want to use our bank.\n\nLorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus.','2016-01-02')
	</cfquery>
	<cfquery>
	INSERT INTO news (title, story, date_published)
	VALUES
		('New High Interest Loans','Is the interest rate on your loan too low? Our new high interest loans might be for you. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus.','2016-08-10')
	</cfquery>
	<div class="alert alert-success">
		Created <code>news</code> table.
	</div>

	<cftry>
		<cfquery>
			DROP TABLE <cfif request.dbType IS "mysql">IF EXISTS</cfif> users
		</cfquery>
		<cfcatch></cfcatch>
	</cftry>

	<cfif request.dbType IS "mysql">
		<cfquery>
			CREATE TABLE `users` (
			  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
			  `username` varchar(100) NOT NULL DEFAULT '',
			  `password` varchar(250) NOT NULL DEFAULT '',
			  `is_admin` int(11) DEFAULT '0',
			  `balance` decimal(10,2) NOT NULL,
			  `photo` varchar(100) DEFAULT NULL,
			  `date_created` datetime DEFAULT NULL,
			  PRIMARY KEY (`id`)
			) ENGINE=InnoDB DEFAULT CHARSET=utf8;
		</cfquery>
	<cfelseif request.dbType IS "derby">
		<cfquery>
			CREATE TABLE users (
			  id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
			  username varchar(100),
			  password varchar(250),
			  is_admin int DEFAULT 0,
			  balance decimal(10,2) NOT NULL,
			  photo varchar(100),
			  date_created timestamp
			)
		</cfquery>
	</cfif>
	<cfquery>
		INSERT INTO users ( username, password, is_admin, balance, photo, date_created)
		VALUES
			('pete','password2',1,23422.53,'pete.png',<cfqueryparam value="2016-03-13 9:23" cfsqltype="cf_sql_timestamp">)
	</cfquery>
	<cfquery>
		INSERT INTO users ( username, password, is_admin, balance, photo, date_created)
		VALUES
			('dave','letmein',0,73234.29,'dave.png',<cfqueryparam value="2016-05-13 7:45" cfsqltype="cf_sql_timestamp">)
	</cfquery>
	<cfquery>
		INSERT INTO users ( username, password, is_admin, balance, photo, date_created)
		VALUES
			('mary','mary',0,9234.44,'mary.png',<cfqueryparam value="2016-09-13 5:26" cfsqltype="cf_sql_timestamp">)
	</cfquery>
	<div class="alert alert-success">
		Created <code>users</code> table.
	</div>

	<cfif structKeyExists(url, "dump")>
		<cfquery name="news">
			SELECT * FROM news
		</cfquery>
		<cfdump var="#news#" label="news">
		<cfquery name="contact">
			SELECT * FROM contact
		</cfquery>
		<cfdump var="#contact#" label="contact">
		<cfquery name="news">
			SELECT * FROM users
		</cfquery>
		<cfdump var="#news#" label="users">

	</cfif>

	<cfcatch>
		<div class="alert alert-danger">
			Exceptions were thrown while rebuilding database: <cfoutput>#cfcatch.message#</cfoutput>
		</div>
		<cfdump var="#cfcatch#">
	</cfcatch>	
</cftry>