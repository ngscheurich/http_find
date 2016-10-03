require "httparty"

module HttpSearch
  class Response
    attr_reader :code
    attr_reader :body

    def initialize(uri)
      party = HTTParty.get(uri)
      @code = party.response.code.to_i
      @body = @code == 200 ? party.response.body : nil
    end
  end
end
