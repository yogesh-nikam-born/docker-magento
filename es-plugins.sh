#!/bin/bash

bin/elasticsearch-plugin install analysis-icu
bin/elasticsearch-plugin install analysis-phonetic

exec /usr/local/bin/docker-entrypoint.sh elasticsearch