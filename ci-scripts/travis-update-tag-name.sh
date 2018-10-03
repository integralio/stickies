#!/bin/bash
curl -X PATCH -H "Travis-API-Version: 3"    -H "Content-Type: application/json"    -H "Authorization: token $TRAVIS_TOKEN"  -d '{ "env_var.value": "'$1'", "env_var.public": false }' https://api.travis-ci.org/repo/21182775/env_var/d6f672d4-e0fd-48b8-b249-ff5b1044aa35
