#!/bin/bash
# Calculate the duration between two datetimes
# E.g:
# $ ./duration.sh 2013-08-0623:17:34 2013-08-0706:20:03
# Duration (seconds): 25349

timestamp(){
  date -jf "%F %T" $* +%s
}

starttime=$(timestamp $1)
endtime=$(timestamp $2)
duration=$(expr $endtime - $starttime)

echo "Duration (seconds): $duration"
