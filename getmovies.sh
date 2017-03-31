#! /bin/bash -

get_ids() {
  jq -r .[].id "theatres.json"
}

for id in $( get_ids ); do
  curl -s "https://feeds.drafthouse.com/adcService/showtimes.svc/calendar/$id/" \
    | jq -r -f "./calendar_film_names.jq"
done \
  | sort \
  | uniq
