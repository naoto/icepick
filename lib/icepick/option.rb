module Icepick
  class Option < Hash
    
    def self.parse(args)
      options = Option.new
      option = OptionParser.new
      option.on('-d','--directory VAL'){ |v| options[:directory] = v }
      word = option.permute!(args)
      options[:search_word] = word.first unless word.nil?
      options
    end

    def initialize
      super
      self[:directory] = Dir::pwd
    end

  end
end
