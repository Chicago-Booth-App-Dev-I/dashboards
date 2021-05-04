class ApplicationController < ActionController::Base

def forex_home
  @raw_data = open("https://api.exchangerate.host/symbols").read
  @parsed_data = JSON.parse(@raw_data)

  @symbols_hash = @parsed_data.fetch("symbols")
  @list_of_symbols = @symbols_hash.keys

  render({:template => "forex/home.html.erb"})
end



end
