#!/bin/bash

curl -X GET -H "Travis-API-Version: 3"    -H "Content-Type: application/json"    -H "Authorization: token $TRAVIS_TOKEN" https://api.travis-ci.org/repo/"$1"%2F"$2"/env_vars 2>/dev/null | python -c "import sys, json; print [env_var for env_var in json.load(sys.stdin)['env_vars'] if env_var['name'] == 'BACKEND_JAR_FILENAME'][0]['@href']"

#python -c "import sys, json; print json.load(sys.stdin)['env_vars'][1]['@href']"

#./travis-read-env-vars.sh integralio stickies | python -c "import sys, json; print [env_var for env_var in json.load(sys.stdin)['env_vars'] if env_var['name'] == 'BACKEND_JAR_FILENAME'][0]['@href']"
