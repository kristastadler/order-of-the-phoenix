class SearchController < ApplicationController
  def index
    house = params[:house]

    conn = Faraday.new(url: "https://www.potterapi.com/v1/") do |faraday|
      faraday.headers['Content-Type'] = 'application/json'
    end

    response = conn.get("characters?key=$2a$10$R2Pc5iDSB5zy9Rkzd8cue.YaA7ct8sYuMhZTdYYqBnfy2JjeZ4vUK&house=Gryffindor&orderOfThePhoenix=true")
    require "pry"; binding.pry
  end
end
