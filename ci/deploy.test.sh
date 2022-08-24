#!/bin/bash

source  ./config.txt

echo "running test pipeline"

echo "updating main branch from remote"


echo "enter branch to build test against: "

read BRANCH

echo "pulling branch $BRANCH from remote"
git pull origin $BRANCH
git checkout $BRANCH

echo "running npm install to update dependencies..."

npm install
echo "done"

echo "running npm build..."

npm run build
echo "done"

echo "running client build"

cd ../client && npm install && npm run build

echo "done"

echo "returninng to ci"
cd ../ci
echo "done"	
# echo "running npm test"

# npm run test


if [ -d "$DEPLOY_PATH_TEST" ]
then
    echo "deploy path already exists, skipping creation"
else
    mkdir "$DEPLOY_PATH_TEST"
fi

if [[ "$OS" == "windows" ]]; then
  echo "moving new dist to test path..."
  cp -R "$SOURCE_PATH"/dist/ "$DEPLOY_PATH_TEST"/
  cp -R "$SOURCE_PATH"/client/build/ "$DEPLOY_PATH_TEST"/dist/
  echo "done"
  echo "checking for existing views folder"
  # my code goes here
  if [ "$DEPLOY_PATH_TEST"/dist/views ]
  then 
    echo "deleting existing views folder"
    rm -r "$DEPLOY_PATH_TEST"/dist/views 
    echo "deleted existing views folder"

  echo "rename build path"
    mv "$DEPLOY_PATH_TEST"/dist/build "$DEPLOY_PATH_TEST"/dist/views
  echo "done"

  echo "moving node module dependencies to test path..."
  cp -R "$SOURCE_PATH"/node_modules/ "$DEPLOY_PATH_TEST"/
  echo "done"

elif [[ "$OS" == "mac" ]]; then
  echo "moving new dist to test path..."
  cp -R "$SOURCE_PATH"/dist/ "$DEPLOY_PATH_TEST"/dist
  echo "done"
  echo "moving node module dependencies to test path..."
  cp -R "$SOURCE_PATH"/node_modules/ "$DEPLOY_PATH_TEST"/node_modules
  echo "done"
else
  echo "unknown OS"
  exit 1
fi

echo "generate server web config"


if [ -f "$DEPLOY_PATH_TEST"/web.config ]
then
    echo "web config exists for server. skipping creation"
    echo "NOTE: for iis deployments, remember to add your new env variables to web.config file (within the <appSettings> section)"
else
  cat >> "$DEPLOY_PATH_TEST"/web.config << EOF
  <configuration>
    <system.webServer>

      <!-- indicates that the server.js file is a node.js application 
      to be handled by the iisnode module -->
      <httpErrors existingResponse="PassThrough" />
      <iisnode nodeProcessCommandLine="C:\Program Files\nodejs\node.exe" />

      <handlers>
        <add name="iisnode" path="dist/index.js" verb="*" modules="iisnode" />
      </handlers>
      
      <rewrite>
        <rules>
          <rule name="api">
            <match url="/*" />
            <action type="Rewrite" url="dist/index.js" />
          </rule>
        </rules>
      </rewrite>
          <directoryBrowse enabled="false" />

    </system.webServer>
      <system.web>
          <authentication mode="Windows" />
      </system.web>
    <appSettings>
    
    </appSettings>
  </configuration>
EOF

fi

echo "generate client web config"

if [ -f  "$DEPLOY_PATH_TEST"/dist/views/web.config ]
then
    echo "web config exists for client. skipping creation"
else
cat >> "$DEPLOY_PATH_TEST"/dist/views/web.config << EOF
<?xml version="1.0" encoding="UTF-8"?>
<configuration>
  <system.webServer>
  <rewrite>
      <rules>
     <rule name="Rewrite Text Requests" stopProcessing="true">
         <match url=".*" />
             <conditions>
                        <add input="{HTTP_METHOD}" pattern="^GET$" />
                        <add input="{HTTP_ACCEPT}" pattern="^text/html" />
                        <add input="{REQUEST_FILENAME}" matchType="IsFile" negate="true" />
             </conditions>
             <action type="Rewrite" url="/index.html" />
     </rule>
</rules>
    </rewrite>
</system.webServer>
	<appSettings>
		<add key="GENERATE_SOURCEMAP" value="false" />
  </appSettings>
</configuration>
EOF
fi

echo "NOTE: for iis deployments, remember to add your env variables to web.config file (within the <appSettings> section)"

echo "completed pipeline on test"
