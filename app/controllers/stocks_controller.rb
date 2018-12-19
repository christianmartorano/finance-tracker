class StocksController < ApplicationController
  def search
    if params[:stock].blank?
      flash[:danger] = "You have entered empty value."
    else
      @stock = Stock.search_stock(params[:stock])
      flash[:danger] = "You have entered an incorrect Symbol." unless @stock
    end
    respond_to do |format|
      format.js {render partial: 'users/result'}
    end
  end
end
