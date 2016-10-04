require "optparse"

module HttpFind
  class Cli
    def initialize
      @options = {}
      gather_opts
    end

    def find(uri, term)
      subject = @options[:regexp] ? /#{term}/ : term
      HttpFind.find(uri, subject).each { |l| puts l }
    end

    private

    def gather_opts
      OptionParser.new do |opts|
        opts.banner = "Usage: httpfind [options] URI TERM"

        opts.on("-e", "--regexp",
                "Indicate that TERM is a regular expression") do |e|
          options[:regexp] = e
        end

        opts.on("-v", "--version", "Show version info") do
          puts "httpfind #{HttpFind::VERSION}"
          exit
        end

        opts.on("-h", "--help", "Display this message") do
          puts opts
          exit
        end
      end.parse!
    end
  end
end
