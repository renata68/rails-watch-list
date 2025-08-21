Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # 1.Lists
  # display all lists
  get "lists", to: "lists#index"

  # form to create a new list
  get "lists/new", to: "lists#new"

  # create a new list (form submission)
  post "lists", to: "lists#create"

  # show details of one list
  get "lists/:id", to: "lists#show"

  # 2.Movies
  # 3.Bookmarks
end
