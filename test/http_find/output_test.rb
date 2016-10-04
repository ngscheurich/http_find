require "test_helper"
require "colorize"

class HttpFind::OutputTest < Minitest::Test
  def test_that_it_formats_lines_correctly
    matches = [
      { line: 32, text: "piyo" },
      { line: 345, text: "hoge" }
    ]

    sep = " | ".light_black
    expected = [" 32".light_black + sep + "piyo"]
    expected << "345".light_black + sep + "hoge"
    output = HttpFind::Output.new(matches)
    result = output.lines

    assert_equal expected, result
  end
end
