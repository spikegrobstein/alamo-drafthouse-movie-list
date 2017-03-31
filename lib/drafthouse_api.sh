BASE_URL="https://feeds.drafthouse.com/adcService/showtimes.svc"

drafthouse::url_for() {
  local type=$1
  local id=$2

  echo "$BASE_URL/$type/$id/"
}

drafthouse::get() {
  local type=$1
  local id=$2

  curl -s \
    -XGET \
    "$( drafthouse::url_for "$type" "$id" )"
}
