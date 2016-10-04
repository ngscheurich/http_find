require "http_search/version"
require "http_search/response"
require "http_search/matcher"
require "http_search/output"
require "http_search/cli"

module HttpSearch
  def self.find(uri, subject)
    response = HttpSearch::Response.new(uri)
    matcher = HttpSearch::Matcher.new(response.body)
    output = HttpSearch::Output.new(matcher.match(subject))
    output.lines
  end
end
