require "test_helper"

class HttpSearch::CliTest < Minitest::Test
  def test_find_command
    stub_request(:get, "www.example.org").
      to_return(status: 200, body: "Hello\nYellow")

    expected = "1 | H\e[0;33;49mello\e[0m\n2 | Y\e[0;33;49mello\e[0mw\n"
    out, err = capture_io do
      HttpSearch::Cli.new.find("http://www.example.org", "ello")
    end

    assert_equal expected, out
  end
end
