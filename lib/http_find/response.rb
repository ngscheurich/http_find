require "httparty"

module HttpFind
  class Response
    attr_reader :code
    attr_reader :body

    def initialize(uri)
      furi = uri.start_with?("http") ? uri : "http://#{uri}"
      party = HTTParty.get(furi)
      @code = party.response.code.to_i
      @body = @code == 200 ? party.response.body : nil
    end
  end
end
