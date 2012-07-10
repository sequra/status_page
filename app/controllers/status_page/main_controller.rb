module StatusPage
  class MainController < ApplicationController
    def index
      @status = ApplicationStatus.check
      @status.simulate_error   if params[:simulate_error]
      @status.simulate_warning if params[:simulate_warning]
    end
  end
end
