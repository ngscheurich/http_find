module HttpFind
  class Output
    LINENUM_COLOR = :light_black

    def initialize(matches)
      @matches = matches
    end

    def lines
      justlen = @matches.map { |m| m[:line] }.sort.last.to_s.length
      @matches.map do |m|
        line = m[:line].to_s.rjust(justlen).colorize(LINENUM_COLOR)
        text = m[:text]
        line + " | ".colorize(LINENUM_COLOR) + text
      end
    end
  end
end
