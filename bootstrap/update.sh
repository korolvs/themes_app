#!/usr/bin/env bash
cp /public/custom_variables.less /bootstrap/less/custom_variables.less
grunt less:compileCore
cp /bootstrap/dist/css/bootstrap.css /public/bootstrap.css