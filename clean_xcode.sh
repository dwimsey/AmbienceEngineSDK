#!/bin/sh
rm -rf DerivedData
find . -name build | grep -v depends | xargs rm -rf
