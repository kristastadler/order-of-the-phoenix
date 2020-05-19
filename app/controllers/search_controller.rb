class SearchController < ApplicationController
  def index
    @house = params[:house]

    conn = Faraday.new(url: "https://www.potterapi.com/v1/") do |faraday|
      faraday.headers['Content-Type'] = 'application/json'
    end

    response = conn.get("characters?key=#{ENV['POTTER_API_KEY']}&house=#{@house}&orderOfThePhoenix=true")
    @members = JSON.parse(response.body, symbolize_names: true)

  end
end
