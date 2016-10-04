require "test_helper"

class HttpSearchTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HttpSearch::VERSION
  end

  def test_that_it_finds_in_source
    stub_request(:get, "www.example.org").
      to_return(status: 200, body: "Hello\nYellow")

    expected = [
      "1 | H\e[0;33;49mello\e[0m",
      "2 | Y\e[0;33;49mello\e[0mw"
    ]
    result = HttpSearch.find("http://www.example.org", "ello")

    assert_equal expected, result
  end
end
