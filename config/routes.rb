Rails.application.routes.draw do
  root to: redirect('/videos')
  resources :videos
  resources :categories, only: [:index]
end
