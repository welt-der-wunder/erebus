# Copyright (c) 2021 Welt der Wunder Sendebetrieb GmbH
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

class Erebus::Eth

  attr_accessor :host, :port, :private_raw_key

  def initialize(private_raw_key = nil, host = "127.0.0.1", port = "8545")
    @private_raw_key = private_raw_key
    @host = host
    @port = port
  end

  # ETH Namespace = JSON RPC 2.0 API Methods

  # eth_accounts:
  # Returns a list of addresses owned by client
  #
  # Parameter:
  # none
  #
  # Returns:
  # Array of addresses owned by the client
  #
  def accounts
    response = query(nil, __method__)
    return response
  end

  # eth_getBalance:
  # Returns the balance of the account of given address
  #
  # Parameter:
  # 1. WIF address to check for balance
  # 2. Hex block number, or the string "latest", "earliest" or "pending" (optional)
  #
  # Example Parameter:
  # get_balance('0xc94770007dda54cF92009BFF0dE90c06F603a09f','latest')
  #
  # Returns:
  # Hex of the current balance in wei
  #
  def get_balance(address, block_number = "latest")
    params = [ address, block_number ]
    response = query(params, __method__)
    return response
  end

  # eth_blockNumber:
  # Returns the number of most recent block
  #
  # Parameter:
  # none
  #
  # Returns:
  # Hex of the current block number the client is on
  #
  def block_number
    response = query(nil, __method__)
    return response
  end

  # eth_gasPrice:
  # Returns the current price per gas in wei
  #
  # Parameter:
  # none
  #
  # Returns:
  # Integer of the current gas price in wei
  #
  def gas_price
    response = query(nil, __method__)
    return response
  end

  private

  def query(params_hash, method)
    response = Erebus::RPC.query("eth_#{sanitize(method)}", params_hash, "http://#{@host}:#{@port}")
    return response
  end

  def sanitize(method)
    method.to_s.camelize.uncapitalize
  end

end