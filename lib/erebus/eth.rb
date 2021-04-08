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

  # JSON RPC 2.0 API Methods

  def get_balance(address, block_number)
    params = [ address, block_number ]
    response = query(params, __method__)
    return response
  end

  def block_number
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