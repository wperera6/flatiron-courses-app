class SearchController < ApplicationController


  def search
    @query = params[:query]
    @results = Course.where("name LIKE ?", "%#{@query}%").limit(4)
  end

end
