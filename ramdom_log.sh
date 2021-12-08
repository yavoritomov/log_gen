#!/bin/bash
events_per_min='60'
while 'true'
do
   waitTime=$(bc <<< "scale=2; 60/$events_per_min")
   sleep "$waitTime" &
   wait $!
   instruction=$(shuf -i 0-4 -n 1)
   d=$(date -Iseconds)
   case "$instruction" in
      "1") echo "{\"@timestamp\": \"$d\", \"level\": \"ERROR\", \"message\": \"something happened in this execution.\", \"rate\": \"Current rate of events(logs) $events_per_min per min.\"}"
      ;;
      "2") echo "{\"@timestamp\": \"$d\", \"level\": \"INFO\", \"message\": \"takes the value and converts it to string.\", \"rate\": \"Current rate of events(logs) $events_per_min per min.\"}"
      ;;
      "3") echo "{\"@timestamp\": \"$d\", \"level\": \"WARN\", \"message\": \"variable not in use.\", \"rate\": \"Current rate of events(logs) $events_per_min per min.\"}"
      ;;
      "4") echo "{\"@timestamp\": \"$d\", \"level\": \"DEBUG\", \"message\": \"first loop completed.\", \"rate\": \"Current rate of events(logs) $events_per_min per min.\"}"
      ;;
   esac
done
