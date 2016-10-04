require "test_helper"

class HttpFind::MatcherTest < Minitest::Test
  def test_that_it_matches_a_string
    text = "Test\nHello Yellow"

    matcher = HttpFind::Matcher.new(text)
    str = "ello"

    match = {
      line: 2,
      text: "H\e[0;33;49mello\e[0m Y\e[0;33;49mello\e[0mw"
    }
    assert_equal [match], matcher.match(str)
  end

  def test_that_it_matches_a_regexp
    text = "The 1st one, the 2nd one, and the 3rd thing"

    matcher = HttpFind::Matcher.new(text)
    regexp = /\d.{2} one/

    match = {
      line: 1,
      text: "The \e[0;33;49m1st one\e[0m, the \e[0;33;49m2nd one\e[0m, and the 3rd thing"
    }
    assert_equal [match], matcher.match(regexp)
  end
end
