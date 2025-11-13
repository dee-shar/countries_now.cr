# countries_now.cr
Web-API for [countriesnow.space](https://countriesnow.space/) which provides geo location, population and general information about countries and cities (in simple JSON response)

## Example
```cr
require "./countries_now"

countries_now = CountriesNow.new
countries_population = countries_now.get_countries_population()
puts countries_population
```
