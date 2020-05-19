class SearchController < ApplicationController
  def index
    @house = params[:house]
    results = OrderResults.new
    @order_members = results.members(params[:house])
  end
end
