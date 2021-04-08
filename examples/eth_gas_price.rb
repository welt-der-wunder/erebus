require 'erebus'
eth = Erebus::Eth.new
response = eth.gas_price
puts "#{response}"