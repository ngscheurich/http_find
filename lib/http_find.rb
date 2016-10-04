require "http_find/version"
require "http_find/response"
require "http_find/matcher"
require "http_find/output"
require "http_find/cli"

module HttpFind
  def self.find(uri, subject)
    response = HttpFind::Response.new(uri)
    matcher = HttpFind::Matcher.new(response.body)
    output = HttpFind::Output.new(matcher.match(subject))
    output.lines
  end
end
