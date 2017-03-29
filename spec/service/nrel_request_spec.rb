require 'rails_helper'

describe 'NrelRequest' do
  it '#nearest_stations' do
    request = NrelRequest.new(ENV['api_key'])

    stations = request.nearest_stations("80203")

    expect(stations.count).to eq(10)
    expect(stations.first["distance"]).to eq(0.3117)
    expect(stations.last["distance"]).to eq(0.88537)

    stations.each do |station|
      expect(station["fuel_type_code"]).to be_in(["ELEC", "LPG"])
    end

  end
end