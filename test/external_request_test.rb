require "test_helper"

class ExternalRequestTest < Minitest::Test
  def test_external_requests_are_blocked
    uri = URI("http://httpbin.org")

    assert_raises WebMock::NetConnectNotAllowedError do
      Net::HTTP.get(uri)
    end
  end

  def test_stubbed_request
    uri = URI("http://www.example.com")

    response = Net::HTTP.get(uri)

    assert_instance_of String, response
  end
end
