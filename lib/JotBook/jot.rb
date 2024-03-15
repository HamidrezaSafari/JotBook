require 'date'

module JotBook
  class Jot
    MATCHER = /^(\d+-\d+-\d+)-jot-(.*)\.([^.]+)$/

    attr_accessor :date, :slug, :ext,:base,:name

    def self.valid?(name)
      name =~ MATCHER
    end

    def initialize(base, name)
      @base = base
      @name = name

      self.process(name)
    end

    def url
      self.date + self.slug
    end

    def process(name)
      m, date, slug, ext = *name.match(MATCHER)
      self.date = DateTime.parse(date).strftime("%Y-%m-%d")
      self.slug = slug
      self.ext = ext
    end
  end
end
