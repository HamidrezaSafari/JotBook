
module JotBook
  class Site
    attr_accessor :source, :dest
    attr_accessor :layouts, :jotes
    attr_accessor :config
    attr_accessor :generators

    def initialize(config)
      self.config = config
      @source = config[:source]
      @dest = config[:destination]
      @plugins = config[:plugins]
      @layouts = config[:layouts]

      self.jotes = []

      process
    end

    def process
      self.read_jotes
      self.setup
      self.generate
    end

    def setup
       Dir[File.join(@plugins, "*.rb")].each do |plugin|
        require plugin
      end
      @generators = Generator.subclasses.map do |c|
        c.new(self.config,self.jotes)
      end
    end

    def generate
      @generators.each do |generator|
        generator.generate
      end
    end

    def read_jotes
      base = File.join(@source)
      entries = Dir.entries(base)
      entries = entries.reject { |e| File.directory?(e)}
      entries.each do |f|
        if Jot.valid?(f)
          self.jotes << Jot.new(base, f)
        end
      end
    end
  end
end
