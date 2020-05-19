class OrderResults
  def members(house)

    json = PotterService.new.members_of_order(house)
    @members = json.map do |member_info|
      Member.new(member_info)
    end
  end
end
