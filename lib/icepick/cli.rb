module Icepick
  class CLI
    
    def self.start(option)
      cli = CLI.new option
      cli.search
    end

    def initialize(args)
      @options = Icepick::Option.parse(args)
    end

    def search
      Icepick::PDF.directory(@options[:directory]).delete_if do |pdf|
        pdf.search(@options[:search_word]).nil?
      end
    end

  end
end
