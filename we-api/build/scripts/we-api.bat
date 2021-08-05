@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  we-api startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and WE_API_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto execute

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\we-api-1.0-SNAPSHOT.jar;%APP_HOME%\lib\httpclient-4.5.12.jar;%APP_HOME%\lib\commons-io-2.4.jar;%APP_HOME%\lib\spring-boot-starter-websocket-2.2.0.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-web-2.2.0.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-thymeleaf-2.0.1.RELEASE.jar;%APP_HOME%\lib\gson-2.8.7.jar;%APP_HOME%\lib\Java-WebSocket-1.3.0.jar;%APP_HOME%\lib\httpcore-4.4.12.jar;%APP_HOME%\lib\commons-codec-1.13.jar;%APP_HOME%\lib\spring-boot-starter-json-2.2.0.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-validation-2.2.0.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-2.2.0.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-tomcat-2.2.0.RELEASE.jar;%APP_HOME%\lib\spring-webmvc-5.2.0.RELEASE.jar;%APP_HOME%\lib\spring-websocket-5.2.0.RELEASE.jar;%APP_HOME%\lib\spring-web-5.2.0.RELEASE.jar;%APP_HOME%\lib\spring-messaging-5.2.0.RELEASE.jar;%APP_HOME%\lib\thymeleaf-spring5-3.0.11.RELEASE.jar;%APP_HOME%\lib\thymeleaf-extras-java8time-3.0.4.RELEASE.jar;%APP_HOME%\lib\spring-boot-autoconfigure-2.2.0.RELEASE.jar;%APP_HOME%\lib\spring-boot-2.2.0.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-logging-2.2.0.RELEASE.jar;%APP_HOME%\lib\jakarta.annotation-api-1.3.5.jar;%APP_HOME%\lib\spring-context-5.2.0.RELEASE.jar;%APP_HOME%\lib\spring-aop-5.2.0.RELEASE.jar;%APP_HOME%\lib\spring-beans-5.2.0.RELEASE.jar;%APP_HOME%\lib\spring-expression-5.2.0.RELEASE.jar;%APP_HOME%\lib\spring-core-5.2.0.RELEASE.jar;%APP_HOME%\lib\snakeyaml-1.25.jar;%APP_HOME%\lib\jackson-datatype-jdk8-2.10.0.jar;%APP_HOME%\lib\jackson-datatype-jsr310-2.10.0.jar;%APP_HOME%\lib\jackson-module-parameter-names-2.10.0.jar;%APP_HOME%\lib\jackson-databind-2.10.0.jar;%APP_HOME%\lib\tomcat-embed-websocket-9.0.27.jar;%APP_HOME%\lib\tomcat-embed-core-9.0.27.jar;%APP_HOME%\lib\tomcat-embed-el-9.0.27.jar;%APP_HOME%\lib\jakarta.validation-api-2.0.1.jar;%APP_HOME%\lib\hibernate-validator-6.0.17.Final.jar;%APP_HOME%\lib\thymeleaf-3.0.11.RELEASE.jar;%APP_HOME%\lib\logback-classic-1.2.3.jar;%APP_HOME%\lib\log4j-to-slf4j-2.12.1.jar;%APP_HOME%\lib\jul-to-slf4j-1.7.28.jar;%APP_HOME%\lib\slf4j-api-1.7.28.jar;%APP_HOME%\lib\spring-jcl-5.2.0.RELEASE.jar;%APP_HOME%\lib\jackson-annotations-2.10.0.jar;%APP_HOME%\lib\jackson-core-2.10.0.jar;%APP_HOME%\lib\jboss-logging-3.4.1.Final.jar;%APP_HOME%\lib\classmate-1.5.0.jar;%APP_HOME%\lib\attoparser-2.0.5.RELEASE.jar;%APP_HOME%\lib\unbescape-1.1.6.RELEASE.jar;%APP_HOME%\lib\logback-core-1.2.3.jar;%APP_HOME%\lib\log4j-api-2.12.1.jar


@rem Execute we-api
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %WE_API_OPTS%  -classpath "%CLASSPATH%"  %*

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable WE_API_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%WE_API_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
