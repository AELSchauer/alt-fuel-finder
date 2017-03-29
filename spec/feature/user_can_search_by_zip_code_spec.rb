require 'rails_helper'

RSpec.feature 'user can search by zip code' do
  scenario 'by going to the root page' do
    raw_stations_data = NrelRequest.new(ENV['api_key']).nearest_stations("80203")

    visit '/'

    fill_in 'zip_code', with: '80203'
    click_on 'Locate'

    expect(current_path).to eq("/search?zip_code=80203")

    raw_stations_data.each_with_index do |station, i|
      within(:css, "tr#station-{i}") do
        expect(page).to have_content(station["station_name"])
        expect(page).to have_content(station["street_address"])
        expect(page).to have_content(station["city"])
        expect(page).to have_content(station["state"])
        expect(page).to have_content(station["zip"])
        expect(page).to have_content(station["fuel_type_code"])
        expect(page).to have_content(station["distance"])
        expect(page).to have_content(station["access_days_time"])
      end
    end
  end
end