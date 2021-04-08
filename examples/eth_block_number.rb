require 'erebus'
eth = Erebus::Eth.new
response = eth.block_number
puts "#{response}"