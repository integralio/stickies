#!/bin/bash
curl -H "Travis-API-Version: 3"    -H "Content-Type: application/json"    -H "Authorization: token $TRAVIS_TOKEN"  -d '{ "env_var.name": "'$1'", "env_var.value": "initialvalue", "env_var.public": false }' https://api.travis-ci.org/repo/21182775/env_vars 
