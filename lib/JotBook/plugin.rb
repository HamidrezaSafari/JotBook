module JotBook
  class Plugin
    PRIORITIES = { :lowest => -100,
                   :low => -10,
                   :normal => 0,
                   :high => 10,
                   :highest => 100 }

    def self.subclasses
      @subclasses ||= []
    end

    def self.inherited(base)
      subclasses << base
      subclasses.sort!
    end

    def self.priority(priority = nil)
      @priority ||= nil
      if priority && PRIORITIES.has_key?(priority)
        @priority = priority
      end
      @priority || :normal
    end

    def self.safe(safe = nil)
      if safe
        @safe = safe
      end
      @safe || false
    end

    def self.<=>(other)
      PRIORITIES[other.priority] <=> PRIORITIES[self.priority]
    end

    def initialize(config = {})
      # no-op for default
    end
  end
end
