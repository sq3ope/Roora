set APP_ENGINE_VERSION=1.6.5
set ARTIFACT_NAME=Roora
set ARTIFACT_VERSION=0.1.0.BUILD-SNAPSHOT

C:%HOMEPATH%\.m2\repository\com\google\appengine\appengine-java-sdk\%APP_ENGINE_VERSION%\appengine-java-sdk-%APP_ENGINE_VERSION%\bin\appcfg.cmd update target/%ARTIFACT_NAME%-%ARTIFACT_VERSION%
