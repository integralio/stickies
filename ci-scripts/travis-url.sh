#!/bin/bash
curl -H "Travis-API-Version: 3"      -H "Authorization: token $TRAVIS_TOKEN"  https://api.travis-ci.org/repo/21182775/env_vars
