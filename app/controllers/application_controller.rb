class ApplicationController < ActionController::Base

def forex_home
  @raw_data = open("https://api.exchangerate.host/symbols").read
  @parsed_data = JSON.parse(@raw_data)

  @symbols_hash = @parsed_data.fetch("symbols")
  @list_of_symbols = @symbols_hash.keys

  render({:template => "forex/home.html.erb"})
end

def currency_choice
  @raw_data = open("https://api.exchangerate.host/symbols").read
  @parsed_data = JSON.parse(@raw_data)

  @symbols_hash = @parsed_data.fetch("symbols")
  @list_of_symbols = @symbols_hash.keys

  @currency_choice = params.fetch("first_currency")

  render({:template => "forex/first_currency.html.erb"})

end

def to_convert
  @raw_data = open("https://api.exchangerate.host/symbols").read
  @parsed_data = JSON.parse(@raw_data)

  @symbols_hash = @parsed_data.fetch("symbols")
  @list_of_symbols = @symbols_hash.keys

  @currency_choice = params.fetch("first_currency")
  @currency_convert = params.fetch("second_currency")

  render({:template => "forex/second_currency.html.erb"})

end


end
