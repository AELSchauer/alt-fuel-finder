require 'rails_helper'

describe 'NrelRequest' do
  it '#fuel_stations' do
    NrelRequest.new(ENV['api_key'])
  end
end