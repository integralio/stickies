#!/bin/bash

curl -X GET -H "Travis-API-Version: 3"    -H "Content-Type: application/json"    -H "Authorization: token $TRAVIS_TOKEN" https://api.travis-ci.org/repo/"$1"%2F"$2"/env_vars 2>/dev/null
