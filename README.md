# Hacking the Alamo Drafthouse

This is a set of scripts that hits the Alamo Drafthouse API and lists every movie playing in their current
calendar.

The whole purpose of this is to see the details of special movie nights (Video Vortex, Weird Wednesday, Terror
Tuesday) across the country.

## Using it

This repo has a `theatres.json` file already in the repo, so you don't need to generate it. But if you do need
it, you can run:

    ./generate_theatres.sh > theatres.json

All you really need to do is clone this repo and:

    ./getmovies.sh

It will list, in alphabetical order, what movies are in the current calendar. Feel free to hack on this a
little more. There's a lot of good info in the JSON that gets sent by the APIs.

See the `samples` directory for some sample API data.

## Disclaimer

This repo and the author of these tools have zero affiliation with the Alamo Drafthouse. The API that is used
is publicly accessible with no credentials and no workarounds were performed to collect the data.

## License

This repo is explicitly unlicensed.

## Author

Spike Grobstein <me@spike.cx> (A big movie fan.)

