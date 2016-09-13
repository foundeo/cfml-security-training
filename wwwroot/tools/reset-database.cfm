<h3>Rebuilding Database</h3>
<cftry>
	<cfquery>
		DROP TABLE IF EXISTS `contact`
	</cfquery>
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

	<cfquery>
		DROP TABLE IF EXISTS `news`
	</cfquery>
	<cfquery>
		CREATE TABLE `news` (
		  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
		  `title` varchar(100) NOT NULL DEFAULT '',
		  `story` text NOT NULL,
		  `date_published` date DEFAULT NULL,
		  PRIMARY KEY (`id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	</cfquery>
	<cfquery>
	INSERT INTO `news` (`title`, `story`, `date_published`)
	VALUES
		('Low Interest Savings','We are offering our lowest interest rates ever at 0.0000001% interest who doesn\'t want to use our bank.\n\nLorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus.','2016-01-02'),
		('New High Interest Loans','Is the interest rate on your loan too low? Our new high interest loans might be for you. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus.','2016-08-10')

	</cfquery>
	<div class="alert alert-success">
		Created <code>news</code> table.
	</div>

	<cfquery>
		DROP TABLE IF EXISTS `users`
	</cfquery>
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
	<cfquery>
		INSERT INTO `users` (`id`, `username`, `password`, `is_admin`, `balance`, `photo`, `date_created`)
		VALUES
			(1,'pete','password2',1,23422.53,'pete.png','2016-03-13 9:23'),
			(2,'dave','letmein',0,73234.29,'dave.png','2016-05-13 7:45'),
			(3,'mary','mary',0,9234.44,'mary.png','2016-09-13 5:26')
	</cfquery>
	<div class="alert alert-success">
		Created <code>users</code> table.
	</div>


	<cfcatch>
		<div class="alert alert-danger">
			Exceptions were thrown while rebuilding database: <cfoutput>#cfcatch.message#</cfoutput>
		</div>
		<cfdump var="#cfcatch#">
	</cfcatch>	
</cftry>