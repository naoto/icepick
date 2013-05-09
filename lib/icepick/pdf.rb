module Icepick
  class PDF

    def self.directory(path, recursion = false)
      path = recursion ? "#{path}/**/*.pdf": "#{path}/*.pdf"

      Dir::glob(path).map do |f|
        PDF.new f
      end
    end

    def initialize(path)
      @file = path
    end

    def search(word)
      return nil if word.nil?

      macher = nil
      File.open(@file, 'rb') do |io|
        reader = ::PDF::Reader.new(io)
        reader.pages.each do |page|
          macher = "File: #{@file} Page: #{page.number}p" if page.text.index(word)
        end
      end
      macher
    end

  end
end
