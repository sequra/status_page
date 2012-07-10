require 'spec_helper'

module StatusPage
  describe MainController do
    describe "GET 'index'" do
      it 'returns a success request and reports "Status: OK"' do
        get '/status'
        response.should be_success
        response.body.should include("Status: OK")
      end
      it 'reports "Status: Error" if asked to' do
        get '/status', simulate_error: "true"
        response.should be_success
        response.body.should include("Status: Error")
      end
      it 'reports "Status: Warning" if asked to' do
        get '/status', simulate_warning: "true"
        response.should be_success
        response.body.should include("Status: Warning")
      end
    end
  end
end
