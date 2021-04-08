require 'erebus'
eth = Erebus::Eth.new
response = eth.accounts
puts "#{response}"