class StocksController < ApplicationController

  def search
    @stock = Stock.search_stock(params[:stock])
    render 'users/my_portfolio'
  end

end
