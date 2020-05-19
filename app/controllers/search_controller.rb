class SearchController < ApplicationController
  def index
    house = params[:house]

    conn = Faraday.new(url: "https://www.potterapi.com/v1/") do |faraday|
      faraday.headers['Content-Type'] = 'application/json'
    end

    response = conn.get("characters?key=#{ENV['POTTER_API_KEY']}&house=Gryffindor&orderOfThePhoenix=true")
    require "pry"; binding.pry
  end
end
