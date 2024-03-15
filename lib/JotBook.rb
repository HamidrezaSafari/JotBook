# frozen_string_literal: true

require_relative 'JotBook/version'
require_relative 'JotBook/jot'
require_relative 'JotBook/plugin'
require_relative 'JotBook/generator'
require_relative 'JotBook/site'

module JotBook
  class Build
    def self.process(root_path)
      config = {
        source: root_path + '/_jotes',
        destination: root_path + '/_site',
        plugins: root_path + '/_plugins',
        layouts: root_path + '/_layouts'
      }

      JotBook::Site.new(config)
    end
  end
end
