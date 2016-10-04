require "thor"

module HttpFind
  class Cli < Thor
    option :regexp, type: :boolean, default: false, aliases: "-e",
                    desc: "Indicate that TERM is a regular expression"
    desc "find URI TERM", "searches the HTTP GET response of URI for TERM"
    def find(uri, term)
      subject = options[:regexp] ? /#{term}/ : term
      HttpFind.find(uri, subject).each { |l| puts l }
    end

    default_task :find
  end
end
