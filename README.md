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

Requires CF11+ or Lucee 4.5+ and MySQL. You could probably get it running on older versions with minimal work.

### Step 1: MySQL Setup

1) Create a database called `bankofinsecurity`
2) Create a user account `bankofi` with password `bankofi` 

### Start CFML Server

Start up a CFML server, using commandbox you can just do:

  cd wwwroot
  box server start
  
The above will spin up a Lucee server, to start a CF2016 server simply add `cfengine=adobe@2016` to the end of the `box server start` command. Running on CF2016 you will need to add the MySQL database driver to your lib directory in `~/.CommandBox/server/{server-id}/adobe-{version}/WEB-INF/lib`


## History / About

Some of this work was inspired by the [_HackableType_](https://github.com/twelverobots/HackableType) application buily by Pete Freitag & Jason Dean way back 
in 2010. This is an attempt to modernize and 

If you are in need of CFML security training at your organization, please contact [Foundeo Inc.](https://foundeo.com/contact/)
