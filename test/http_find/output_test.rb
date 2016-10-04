require "test_helper"

class HttpFind::OutputTest < Minitest::Test
  def test_that_it_formats_lines_correctly
    matches = [
      { line: 32, text: "piyo" },
      { line: 345, text: "hoge" }
    ]

    expected = [" 32 | piyo", "345 | hoge"]
    output = HttpFind::Output.new(matches)
    result = output.lines

    assert_equal expected, result
  end
end
