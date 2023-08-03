Rails.application.routes.draw do
  namespace :api do
    post 'enron_data/search'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
