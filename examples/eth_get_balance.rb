require 'erebus'
eth = Erebus::Eth.new
response = eth.get_balance("0x499491270a8eabB2FddFE643ECD4438BAf1055Af")
puts "#{response}"