module StatusPage
  class Status
    attr_reader :warnings, :errors

    def initialize
      reset
    end

    def reset
      @warnings = []
      @errors   = []
    end

    def one_word_summary
      return "Error" if errors.any?
      return "Warning" if warnings.any?
      "OK"
    end

    def check
      reset
    end

    def self.check
      new.tap(&:check)   # I think this is kinda cute, so I'm leaving it :D
    end
  end
end
