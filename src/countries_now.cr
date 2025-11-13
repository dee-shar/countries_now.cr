require "json"
require "http/client"

class CountriesNow
  API_PATH = "api/v0.1/countries"
  def initialize
    @headers = HTTP::Headers{
      "Content-Type" => "application/json",
      "Accept" => "application/json",
      "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36"
    }
    uri = URI.parse("https://countriesnow.space")
    @http_client = HTTP::Client.new(uri)
  end

  def get_city(city : String) : JSON::Any
    body = {"city" => city}.to_json
    JSON.parse(
      @http_client.post("/#{API_PATH}/population/cities", headers: @headers, body: body).body)
  end

  def get_cities() : JSON::Any
    JSON.parse(
      @http_client.get("/#{API_PATH}/population/cities", headers: @headers).body)
  end

  def get_country(country : String) : JSON::Any
    body = {"country" => country}.to_json
    JSON.parse(
      @http_client.post("/#{API_PATH}/positions", headers: @headers, body: body).body)
  end

  def get_countries_population() : JSON::Any
    JSON.parse(
      @http_client.get("/#{API_PATH}/population", headers: @headers).body)
  end

  def get_countries_by_range(
      type : String, minimum : Int32, maximum : Int32) : JSON::Any
    body = {
      "type" => type,
      "min" => minimum,
      "max" => maximum
    }.to_json
    JSON.parse(
      @http_client.post("/#{API_PATH}/positions/range", headers: @headers, body: body).body)
  end

  def get_countries_positions() : JSON::Any
    JSON.parse(
      @http_client.get("/#{API_PATH}/flag/images", headers: @headers).body)
  end

  def get_country_flag(iso2 : String) : JSON::Any
    body = {"iso2" => iso2}.to_json
    JSON.parse(
      @http_client.post("/#{API_PATH}/positions", headers: @headers, body: body).body)
  end

  def get_country_currency(country : String) : JSON::Any
    body = {"country" => country}.to_json
    JSON.parse(
      @http_client.post("/#{API_PATH}/currency", headers: @headers, body: body).body)
  end

  def get_countries_currency() : JSON::Any
    JSON.parse(
      @http_client.get("/#{API_PATH}/currency", headers: @headers).body)
  end

  def get_countries_states() : JSON::Any
    JSON.parse(
      @http_client.get("/#{API_PATH}/states", headers: @headers).body)
  end
end
