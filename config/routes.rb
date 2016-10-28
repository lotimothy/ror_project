Rails.application.routes.draw do

  root "sessions#home"

  get "sessions" => "sessions#home"
  get "sessions/login"
  post "logging_in" => "sessions#logging_in"
  delete "sessions" => "sessions#destroy"

  get "parents/new" => "parents#new"
  get "teachers/new" => "teachers#new"

  post "parents" => "parents#create"
  post "teachers" => "teachers#create"

  get "events/index" => "events#index"
  post "events" => "events#create"
  get "events/new" => "events#new"
  get "events/:id/edit" => "events#edit"
  patch "events" => "events#update"
  patch "events/:id" => "events#update"
  delete "events/:id" => "events#destroy"

end
