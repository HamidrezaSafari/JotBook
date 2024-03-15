require 'jotdown'

module JotBook
  class JotDown < Generator
    attr_accessor :config,:jotes
    def initialize(config,jotes)
      @config =  config
      @jotes  =  jotes
    end
    def generate
      @jotes.each do |jot|
        jot_file = File.read(jot.base + '/' + jot.name)
        result = Jotdown::Document.new(jot_file).render
        output_file_name = "#{@config[:destination]}/#{jot.name.sub('.jd','.html')}"
        File.open(output_file_name, 'w') do |f|
          f.write(result)
        end
      end
    end
  end
end
