Rails.application.routes.draw do
  
  root 'static_pages#home'
  get '/signup', to: 'static_pages#signup'
  post '/signup', to: 'companys#create'
  get '/login', to: 'static_pages#login'
  get '/auth/facebook/callback' => 'sessions#create_fb'
  post '/login', to: 'sessions#create'
  post '/sessions/create', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/employees/ofthemonth', to: 'employees#month'
  
  resources :companys do
    resources :employees, shallow: true
  end

  resources :projects, shallow: true do
    resources :tasks do
      resources :comments
    end
  end
  
end