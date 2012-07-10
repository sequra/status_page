require "status_page/engine"

module StatusPage
  mattr_accessor :checks
  self.checks = []
end
