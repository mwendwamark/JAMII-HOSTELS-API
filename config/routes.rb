Rails.application.routes.draw do
  get "/students", to: "students#index"
  get "/student", to: "students#show"
  post "/student-signup", to: "students#create"
  post "/student-login", to: "students_sessions#create"
  delete "/student-logout", to: "students_sessions#destroy"

  # Landlords Routes
  get "/landlords", to: "landlords#index"
  get "/landlord", to: "landlords#show"
  post "/landlord-signup", to: "landlords#create"
  post "/landlord-login", to: "landlords_sessions#create"
  delete "/landlord-logout", to: "landlords_sessions#destroy"

  resources :hostels, only: [:index, :show, :create, :update, :destroy]
end
