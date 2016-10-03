$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "http_search"

require "minitest/autorun"
require "minitest/reporters"
require "webmock/minitest"

Minitest::Reporters.use!

WebMock.disable_net_connect!(allow_localhost: true)

module Minitest
  class Test
    def setup
      stub_request(:get, "www.example.com")
        .with(headers: { "Accept" => "*/*", "User-Agent" => "Ruby" })
        .to_return(status: 200, body: "Hello World")
    end
  end
end
