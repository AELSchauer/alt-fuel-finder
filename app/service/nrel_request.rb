class NrelRequest
  attr_reader :api_key

  def initialize(api_key)
    @api_key = api_key
  end

  def nearest_stations(zip_code)
    conn = Faraday.new("https://api.data.gov/")
    response = conn.get "nrel/alt-fuel-stations/v1/nearest.json", {
      limit: 10,
      location: zip_code,
      radius: 6.0,
      fuel_type: "ELEC,LPG",
      api_key: api_key
    }
    results = JSON.parse(response.body)
    results["fuel_stations"]
  end

end