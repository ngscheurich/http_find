require "test_helper"

class HttpFind::CliTest < Minitest::Test
  def test_find_command
    stub_request(:get, "www.example.org").
      to_return(status: 200, body: "Hello\nYellow")

    sep = " | ".light_black
    expected = "1".light_black + sep + "H\e[0;33;49mello\e[0m\n"
    expected << "2".light_black + sep + "Y\e[0;33;49mello\e[0mw\n"
    out, err = capture_io do
      HttpFind::Cli.new.find("http://www.example.org", "ello")
    end

    assert_equal expected, out
  end
end
