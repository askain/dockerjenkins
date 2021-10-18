#!/bin/bash

docker image rm dockerjenkins

docker build . -t dockerjenkins
