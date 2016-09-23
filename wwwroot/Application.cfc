component {
	this.name = "BankOfInsecuity";
	this.sessionManagement = true;
	this.scriptProtect = "none";
	this.compileExtForInclude = "*";
	this.searchImplicitScopes = true;

	this.sessionCookie.httpOnly = false;
	this.sessionCookie.secure = false;
	this.sessionCookie.timeout = -1;

	//create datasource requires CF11+
	this.datasources["bankofinsecurity"] = {
	  		class: (server.keyExists("lucee")) ? 'org.gjt.mm.mysql.Driver' : 'com.mysql.jdbc.Driver', 
	  		connectionString: 'jdbc:mysql://localhost:3306/bankofinsecurity?useUnicode=true&characterEncoding=UTF-8&allowMultiQueries=true', 
	  		url: 'jdbc:mysql://localhost:3306/bankofinsecurity?useUnicode=true&characterEncoding=UTF-8&allowMultiQueries=true', 
	  		username: 'bankofi', 
	  		password: getMasterPassword(),
	  		driver: "other"
	};

	this.datasource = "bankofinsecurity";

	public void function onApplicationStart() {
		application.dsn = this.datasource;
		application.appRootPath = getDirectoryFromPath(getCurrentTemplatePath());
		application.masterPassword = getMasterPassword();
	}

	public function onRequest(string targetPage) {
		//disable the browsers builtin XSS protection to demo XSS
		cfheader(name="X-XSS-Protection",value="0");
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