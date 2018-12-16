class Stock < ApplicationRecord

  def self.search_stock(symbol)
    stock = StockQuote::Stock.quote(symbol)
    price = strip_commas(stock.latest_price)
    self.new(ticker: stock.symbol, name: stock.company_name, last_price: price)
  end

  private
    def self.strip_commas(price)
      price.to_s.gsub(",", "")
    end

end
