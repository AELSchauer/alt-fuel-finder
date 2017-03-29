class SearchController < ApplicationController
  def index
    # binding.pry
    @stations = request.nearest_stations(params[:zip_code])
  end

  private

  def request
    NrelRequest.new(ENV['api_key'])
  end
end
