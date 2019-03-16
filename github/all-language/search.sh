#!/bin/bash

LICENSE_FILE=license.dat
RESULT_FILE=license.csv

rm -rf $RESULT_FILE
for line in `cat $LICENSE_FILE`
do
  license=$line
  count=`curl https://api.github.com/search/repositories?q=license:$license | jq '.total_count'`
  echo $license,$count >> $RESULT_FILE
  sleep 5s
done
