#! /bin/bash -

. "lib/drafthouse_api.sh"
. "lib/color.bash"

is_valid() {
  local data=$1

  echo "$data" \
    | jq -e . &> /dev/null
}

market_name() {
  local data=$1

  echo "$data" \
    | jq -r .Market.MarketName
}

get_market_data() {
  local data

  for id in $(seq -w 0 100 2100); do
    data=$( drafthouse::get 'market' "$id" )

    if ! is_valid "$data"; then
      log::debug "Skipping $id"
      continue
    fi

    log::info "Got market for ($id): $(market_name "$data")"

    echo "$data"
  done
}

log::info() {
  printf "$(color::get "cyan")%s$(color::off)\n" "$@" >&2
}

log::debug() {
  printf "$(color::get "purple")%s$(color::off)\n" "$@" >&2
}

log::warn() {
  printf "$(color::get "yellow")%s$(color::off)\n" "$@" >&2
}

get_market_data \
  | sponge \
  | jq '[.Market.Dates[].Cinemas[]] | map({"name": .CinemaName, "marketSlug": .MarketSlug, "cinemaSlug": .CinemaSlug, "id": .CinemaId}) | unique | .[]' \
  | jq -s .

