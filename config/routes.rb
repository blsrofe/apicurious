Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"

  get '/auth/github/callback', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  get '/profile', to: 'profile#index'
  get '/all_repos', to: 'profile#all_repos'
  get '/recent_commits', to: 'profile#recent_commits'
end
