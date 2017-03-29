class NrelRequest
  attr_reader :api_key

  def initialize(api_key)
    @api_key = api_key
  end

  def fuel_stations
    conn = Faraday.new("https://api.data.gov/")
    conn.get "nrel/alt-fuel-stations/v1.json", {
      api_key: api_key
    }
  end

end