module HttpSearch
  class Output
    def initialize(matches)
      @matches = matches
    end

    def lines
      justlen = @matches.map { |m| m[:line] }.sort.last.to_s.length
      @matches.map do |m|
        line = m[:line].to_s
        text = m[:text]
        "#{line.rjust(justlen)} | #{text}"
      end
    end
  end
end
