@echo off
set CATALINA_HOME=%cd%\apache-tomcat
call apache-tomcat\bin\startup.bat %CMD_LINE_ARGS%