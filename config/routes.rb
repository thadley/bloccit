Bloccit::Application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }

  resources :users, only: [:show, :index, :update] #route for users#show, users#index
  resources :posts, only: [:index] #route for popular posts
  resources :topics do
    resources :posts, except: [:index], controller: 'topics/posts' do
        resources :comments, only: [:create, :destroy]
        match '/up-vote', to: 'votes#up_vote', as: :up_vote, via: :get
        match '/down-vote', to: 'votes#down_vote', as: :down_vote, via: :get
        resources :favorites, only: [:create, :destroy]
    end
  end

  match "about" => 'welcome#about', via: :get

  root :to => 'welcome#index'

end
