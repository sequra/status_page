require 'spec_helper'

module StatusPage
  describe MainController, :type => :request do
    describe "GET 'index'" do
      it 'returns a success request and reports "Status: OK"' do
        get '/status'
        expect(response).to be_success
        expect(response.body).to include("Status: OK")
      end
      it 'reports "Status: Error" if asked to' do
        get '/status', simulate_error: "true"
        expect(response).to be_success
        expect(response.body).to include("Status: Error")
      end
      it 'reports "Status: Warning" if asked to' do
        get '/status', simulate_warning: "true"
        expect(response).to be_success
        expect(response.body).to include("Status: Warning")
      end
    end
  end
end
