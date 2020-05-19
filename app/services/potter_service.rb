class PotterService

  def conn
    Faraday.new(url: "https://www.potterapi.com/v1/") do |faraday|
      faraday.headers['Content-Type'] = 'application/json'
    end
  end

  def members_of_order(house)
    response = conn.get("characters?key=#{ENV['POTTER_API_KEY']}&house=#{house}&orderOfThePhoenix=true")
    json = JSON.parse(response.body, symbolize_names: true)
  end
end
