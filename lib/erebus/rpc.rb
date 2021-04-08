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

module Erebus

  module RPC
    extend self

    def query(method, params, uri_string)
      uri = URI.parse(uri_string)
      header = {"Content-Type": "application/json"}
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Post.new(uri.request_uri, header)
      request.body = json_query_object(method, params)
      puts "#{request.body}" # DEBUG
      response = http.request(request)
      return response_object(response.body)
    end

    private

    def json_query_object(method, params)
      data = Hash.new
      data[:jsonrpc] = "2.0"
      data[:method] = "#{method}"
      data[:params] = params ? params : []
      data[:id] = SecureRandom.uuid
      return data.to_json
    end

    def response_object(body)
      hash_object = JSON.parse(body)
      return hash_object.transform_keys(&:to_sym)
    end

  end

end