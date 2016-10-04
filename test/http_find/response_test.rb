require "test_helper"

class HttpFind::ResponseTest < Minitest::Test
  def test_that_it_sets_status_code
    response = HttpFind::Response.new("http://www.example.com")

    assert_equal 200, response.code
  end

  def test_that_it_sets_body
    stub_request(:get, "www.example.org").
      to_return(status: 200, body: "This is a test.")

    response = HttpFind::Response.new("http://www.example.org")

    assert_equal "This is a test.", response.body
  end
end
