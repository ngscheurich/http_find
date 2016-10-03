require "test_helper"

class HttpSearchTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HttpSearch::VERSION
  end
end
