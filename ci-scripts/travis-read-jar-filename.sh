#!/bin/bash
curl -X GET -H "Travis-API-Version: 3"    -H "Content-Type: application/json"    -H "Authorization: token $TRAVIS_TOKEN" https://api.travis-ci.org/repo/21182775/env_var/a7ba3e93-21cd-4c78-8cb0-19c3943b526c
