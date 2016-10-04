require "httparty"
require "colorize"

module HttpFind
  class Matcher
    MATCH_COLOR = :yellow

    attr_reader :text

    def initialize(text)
      @text = text
    end

    def match(subj)
      if subj.class == Regexp
        regexp_match(subj)
      else
        string_match(subj.to_s)
      end
    end

    private

    def lines
      @text.split("\n")
    end

    def base_match
      matches = []

      lines.each_with_index do |line, i|
        yield(line, i, matches)
      end

      matches
    end

    def regexp_match(regexp)
      base_match do |line, i, matches|
        regexp_matches = line.scan(regexp)
        unless regexp_matches.empty?
          regexp_matches.each { |m| line.sub!(m, m.colorize(MATCH_COLOR)) }
          matches << result(i + 1, line)
        end
      end
    end

    def string_match(str)
      base_match do |line, i, matches|
        if line.include?(str)
          matches << result(i + 1, line.gsub(str, str.colorize(MATCH_COLOR)))
        end
      end
    end

    def result(line_num, text)
      {
        line: line_num,
        text: text
      }
    end
  end
end
