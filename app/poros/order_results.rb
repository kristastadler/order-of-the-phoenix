class OrderResults
  def members(house)
    conn = Faraday.new(url: "https://www.potterapi.com/v1/") do |faraday|
      faraday.headers['Content-Type'] = 'application/json'
    end

    response = conn.get("characters?key=#{ENV['POTTER_API_KEY']}&house=#{house}&orderOfThePhoenix=true")
    json = JSON.parse(response.body, symbolize_names: true)
    members = json.map do |member_info|
      Member.new(member_info)
    end
  end
end
