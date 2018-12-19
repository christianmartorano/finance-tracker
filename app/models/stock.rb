class Stock < ApplicationRecord

  def self.search_stock(symbol)
    begin
      stock = StockQuote::Stock.quote(symbol)
      price = strip_commas(stock.latest_price)
      self.new(ticker: stock.symbol, name: stock.company_name, last_price: price)
    rescue Exception => e      
      return nil
    end
  end

  private
    def self.strip_commas(price)
      price.to_s.gsub(",", "")
    end

end
