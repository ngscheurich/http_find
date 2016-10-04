require "thor"

module HttpSearch
  class Cli < Thor
    option :regexp, type: :boolean, default: false, aliases: "-e",
                    desc: "Indicate that SUBJECT is a regular expression"
    desc "find SUBJECT URI", "searches the source of URI for SUBJECT"
    def find(uri, subject)
      s = options[:regexp] ? /#{subject}/ : subject
      HttpSearch.find(uri, s).each { |l| puts l }
    end

    default_task :find
  end
end
