Bloccit::Application.routes.draw do
 
  devise_for :users

  resource :topics do
    resources :posts, except: [:index]
  end

  resources :posts

  match "about" => 'welcome#about', via: :get

  root :to => 'welcome#index'

end
