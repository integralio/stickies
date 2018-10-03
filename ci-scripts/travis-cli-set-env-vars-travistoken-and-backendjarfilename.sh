#get a travis API token and set it as an env var in travis-ci.org
travis env set TRAVIS_TOKEN "$(travis token | cut -d ' ' -f4)"

#create the env var BACKEND_JAR_FILENAME , initialized to a dummy temp_value
travis env set BACKEND_JAR_FILENAME temp_value
