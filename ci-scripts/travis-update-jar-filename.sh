#!/bin/bash
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'


#ENCODED_REPO_SLUG=$(urlencode $TRAVIS_REPO_SLUG)
ENCODED_REPO_SLUG=$(python -c "import sys, urllib as ul; print ul.quote_plus('$TRAVIS_REPO_SLUG')")

JARFILE_HREF=$(curl -X GET -H "Travis-API-Version: 3"    -H "Content-Type: application/json"    -H "Authorization: token $TRAVIS_TOKEN" https://api.travis-ci.org/repo/$ENCODED_REPO_SLUG/env_vars 2>/dev/null | python -c "import sys, json; print [env_var for env_var in json.load(sys.stdin)['env_vars'] if env_var['name'] == 'BACKEND_JAR_FILENAME'][0]['@href']")

curl -X PATCH -H "Travis-API-Version: 3"    -H "Content-Type: application/json"    -H "Authorization: token $TRAVIS_TOKEN"  -d '{ "env_var.value": "'$1'", "env_var.public": false }' https://api.travis-ci.org$JARFILE_HREF
