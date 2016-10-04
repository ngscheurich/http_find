require "test_helper"

class HttpFindTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HttpFind::VERSION
  end

  def test_that_it_finds_in_source
    stub_request(:get, "www.example.org").
      to_return(status: 200, body: "Hello\nYellow")

    sep = " | ".light_black
    expected = [
      "1".light_black + sep + "H\e[0;33;49mello\e[0m",
      "2".light_black + sep + "Y\e[0;33;49mello\e[0mw"
    ]
    result = HttpFind.find("http://www.example.org", "ello")

    assert_equal expected, result
  end
end
