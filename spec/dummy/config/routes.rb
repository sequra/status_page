Rails.application.routes.draw do
  scope :module => "status_page" do
    match "/status" => "main#index"
  end
end
