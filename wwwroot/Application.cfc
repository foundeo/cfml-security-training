component {
	this.name = "BankOfInsecuityApp3";
	this.sessionManagement = true;
	this.scriptProtect = "none";
	this.compileExtForInclude = "*";
	this.searchImplicitScopes = true;
	this.blockedExtForFileUpload = "";

	this.sessionCookie.httpOnly = false;
	this.sessionCookie.secure = false;
	this.sessionCookie.timeout = -1;
	this.system = createObject("java", "java.lang.System");
	if (!isNull(this.system.getEnv("DATABASE_TYPE"))) {
		this.dbType = this.system.getEnv("DATABASE_TYPE");
	} else {
		this.dbType = "derby";
	}


	if (this.dbType == "mysql") {
		//create datasource requires CF11+
		this.datasources["bankofinsecurity"] = {
		  		class: (server.keyExists("lucee")) ? 'org.gjt.mm.mysql.Driver' : 'com.mysql.jdbc.Driver',
		  		connectionString: 'jdbc:mysql://localhost:3306/bankofinsecurity?useUnicode=true&characterEncoding=UTF-8&allowMultiQueries=true&serverTimezone=GMT&useLegacyDatetimeCode=false',
		  		url: 'jdbc:mysql://localhost:3306/bankofinsecurity?useUnicode=true&characterEncoding=UTF-8&allowMultiQueries=true&serverTimezone=GMT&useLegacyDatetimeCode=false',
		  		username: 'bankofi',
		  		password: getMasterPassword(),
		  		driver: "other"
		};

	} else if (this.dbType == "derby") {
		this.datasources["bankofinsecurity"] = {
			database: getRootDirectory() & "db/boi/",
			driver: "Apache Derby Embedded"
		};
	}

	this.datasource = "bankofinsecurity";


	this.enableFuseGuard = false;

	this.datasources["fuseguard"] = {
			class: (server.keyExists("lucee")) ? 'org.gjt.mm.mysql.Driver' : 'com.mysql.jdbc.Driver',
			connectionString: 'jdbc:mysql://localhost:3306/fuseguard?useUnicode=true&characterEncoding=UTF-8&allowMultiQueries=true',
			url: 'jdbc:mysql://localhost:3306/fuseguard?useUnicode=true&characterEncoding=UTF-8&allowMultiQueries=true&serverTimezone=GMT&useLegacyDatetimeCode=false',
			username: this.system.getEnv("DB_USER"),
			password: this.system.getEnv("DB_PASS"),
			driver: "other"
	};



	public void function onApplicationStart() {
		application.dsn = this.datasource;
		application.appRootPath = getDirectoryFromPath(getCurrentTemplatePath());
		application.masterPassword = getMasterPassword();

	}


	public function onRequestStart(string targetPage) {
		if (this.enableFuseGuard) {
			if ( !StructKeyExists(server, "fuseguard") || server.fuseguard.shouldReInitialize() ) {
				server.fuseguard = new fuseguard.components.firewall(configurator="DBConfigurator");
			}
			local.ip = (url.keyExists("test_ip")) ? url.test_ip : cgi.remote_addr;
			server.fuseguard.processRequest(ip_address=local.ip);
		}
	}

	public function onRequest(string targetPage) {
		request.dbType = this.dbType;
		//disable the browsers builtin XSS protection to demo XSS
		cfheader(name="X-XSS-Protection",value="0");
		if (this.enableFuseGuard && cgi.script_name contains "/fuseguard/") {
			include arguments.targetPage;
			return;
		}
		include "common/header.cfm";
		if (isLocalhost(cgi.remote_addr)) {
			include arguments.targetPage;
		} else {
			include "common/localhost.cfm";
		}

		include "common/footer.cfm";
	}

	public function onRequestEnd() {
		var logFilePath = getRootDirectory() & "logs/" & dateFormat(now(), "yyyy-mm-dd") & ".log";
		var logMsg = "[#dateTimeFormat(now(), "full")#] #cgi.request_method# #cgi.script_name# #cgi.remote_addr# #cgi.http_user_agent#";
		lock scope="application" type="exclusive" timeout="10" {
			if (!fileExists(logFilePath)) {
				fileWrite(logFilePath, logMsg);
			} else {
				local.fileObject = fileOpen(logFilePath, "append");
				fileWriteLine(local.fileObject, logMsg);
				fileClose(local.fileObject);
			}
		}
	}

	public void function onError(exception, eventName) {
		include "error.cfm";
	}

	public function getRootDirectory() {
		var thisDir = getDirectoryFromPath(getCurrentTemplatePath());
		return reReplace(thisDir, "[^\\/]+[\\/]$", "");
	}

	public string function getMasterPassword() {
		return fileRead(getRootDirectory() & "config/master-password.txt");
	}

}
