# cfml-security-training

This is a CFML web application that intentionally contains many many security vulnerabilties for training purposes. 

Here's a listing of some of the vulnerabilities you can find in this application:

* SQL Injection 
* Cross Site Scripting (XSS)
* Path Traversals
* Remote Code Execution
* File Upload Vulnerabilities
* Insecure Password Storage
* Cross Site Request Forgery
* Insufficient Authentication/Authorization
* Timing Attacks

## Setup / Installation

*Please run this in a virtual machine and keep restricted to localhost so you do not compromise your computer.*

Requires CF11+ or Lucee 4.5+.


### Clone / Download Repository

	cd /somewhere/
	git clone https://github.com/foundeo/cfml-security-training.git .

### Install CommandBox

We'll use commandbox or `box` for short to spin up a local CFML server. You can download it here: [https://www.ortussolutions.com/products/commandbox#download](https://www.ortussolutions.com/products/commandbox#download), please read the [commandbox installation docs](https://ortus.gitbooks.io/commandbox-documentation/content/setup/installation.html) for more info.

### Start CFML Server

Start up a CFML server, using commandbox you can just do:

	cd wwwroot
	box server start cfengine=adobe@2016
  
The above will start up a CF2016 server on a random port number and open your default web browser to the server.


### Optional: MySQL Setup

By default it is setup to use Apache Derby, which should work well for Adobe ColdFusion engines (since it is included by default). If you are using Lucee or want to use MySQL instead of Derby please follow these instructions:

1) Create a empty database called `bankofinsecurity`

2) Create a user account `bankofi` with password `bankofi` 

3) If running on Adobe ColdFusion you will need to add the MySQL database driver to your lib directory in `~/.CommandBox/server/{server-id}/adobe-{version}/WEB-INF/lib`

## History / About

Some of this work was inspired by the [_HackableType_](https://github.com/twelverobots/HackableType) application buily by Pete Freitag & Jason Dean way back 
in 2010. This is an attempt to modernize and simplify.

If you are in need of CFML security training at your organization, please contact [Foundeo Inc.](https://foundeo.com/contact/)
