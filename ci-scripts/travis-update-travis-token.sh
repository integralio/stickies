#!/bin/bash
curl -X PATCH -H "Travis-API-Version: 3"    -H "Content-Type: application/json"    -H "Authorization: token $TRAVIS_TOKEN"  -d '{ "env_var.value": "'$1'", "env_var.public": false }' https://api.travis-ci.org/repo/21182775/env_var/06ce930c-376b-4c90-9d37-b7ca69a60697
