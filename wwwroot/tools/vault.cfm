<cfset vault_token = createObject("java", "java.lang.System").getenv("VAULT_TOKEN")>
<cfset vault_addr = createObject("java", "java.lang.System").getenv("VAULT_ADDR")>
<cfif isNull(vault_token) OR isNull(vault_addr)>
	The <code>VAULT_TOKEN</code> or <code>VAULT_ADDR</code> environment variables are not set.
<cfelse>

	<h1>Vault REST API</h1>

	<!---
	<h2>/v1/sys/init/ <small>Check if Vault is initialized</small></h2>
	<cfhttp url="#vault_addr#/v1/sys/init" method="GET" result="vaultResponse">
		<cfhttpparam type="header" name="X-Vault-Token" value="#vault_token#">
	</cfhttp>
	<pre><cfoutput>#encodeForHTML(vaultResponse.fileContent)#</cfoutput></pre>
	
	<h2>/v1/secret/data/hello <small>Fetch a Secret</small></h2>
	<cfhttp url="#vault_addr#/v1/secret/data/hello" method="GET" result="vaultResponse">
		<cfhttpparam type="header" name="X-Vault-Token" value="#vault_token#">
	</cfhttp>
	<pre><cfoutput>#encodeForHTML(vaultResponse.fileContent)#</cfoutput></pre>
	<cfdump var="#deserializeJSON(vaultResponse.fileContent)#">

	<h2>/v1/secret/data/hello <small>Fetch a Secret without a Token</small></h2>
	<cfhttp url="#vault_addr#/v1/secret/data/hello" method="GET" result="vaultResponse">
		
	</cfhttp>
	<pre><cfoutput>#encodeForHTML(vaultResponse.fileContent)#</cfoutput></pre>

	--->
	

	<h2>transit/encrypt/my-key <small>Encrypt Data</small></h2>
	<cfset data_to_encrypt = "Foundeo">
	<cfset request_body = { "plaintext"=toBase64(data_to_encrypt) }>
	<cfhttp url="#vault_addr#/v1/transit/encrypt/my-key" method="PUT" result="vaultResponse">
		<cfhttpparam type="header" name="X-Vault-Token" value="#vault_token#">
		<cfhttpparam type="header" name="Content-Type" value="application/json">
		<cfhttpparam type="body" value="#serializeJSON(request_body)#">
	</cfhttp>
	<pre><cfoutput>#encodeForHTML(vaultResponse.fileContent)#</cfoutput></pre>
	<cfset encrypt_result = deserializeJSON(vaultResponse.fileContent)>
	<cfdump var="#encrypt_result#">
	<pre><cfoutput>ciphertext: #encodeForHTML(encrypt_result.data.ciphertext)#</cfoutput></pre>

	

	<h2>transit/decrypt/my-key <small>Decrypt Data</small></h2>
	<cfset request_body = { "ciphertext"=encrypt_result.data.ciphertext}>

	<cfhttp url="#vault_addr#/v1/transit/decrypt/my-key" method="PUT" result="vaultResponse">
		<cfhttpparam type="header" name="X-Vault-Token" value="#vault_token#">
		<cfhttpparam type="header" name="Content-Type" value="application/json">
		<cfhttpparam type="body" value="#serializeJSON(request_body)#">
	</cfhttp>
	<pre><cfoutput>#encodeForHTML(vaultResponse.fileContent)#</cfoutput></pre>
	<cfset decrypt_result = deserializeJSON(vaultResponse.fileContent)>
	<cfdump var="#decrypt_result#">
	<pre><cfoutput>plaintext: #encodeForHTML(toString(toBinary(decrypt_result.data.plaintext)))#</cfoutput></pre>

	
	

</cfif>

