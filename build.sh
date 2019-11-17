#!/bin/bash

docker build src/ -t nodejs-12-run

s2i build src/ nodejs-12-run nbmaster/openshift-nodejs-12-run

#docker push nbmaster/openshift-nodejs-12-run