Rails.application.routes.draw do
  scope :module => "status_page" do
    get "/status" => "main#index"
  end
end
