Rails.application.routes.draw do

  root :to => 'users#index' #Rota padrão para login

  # Cria todas as rotas necessárias para o CRUD de usuários
  resources :users

  # Cria todas as rotas necessárias para o CRUD de tasks
  get '/tasks' => 'tasks#index'
  post '/tasks/create' => 'tasks#create'
  post '/tasks/update' => 'tasks#update'
  post '/tasks/destroy' => 'tasks#destroy'
  post '/tasks/complete' => 'tasks#complete'

  # Cria rotas para recurso de sessões
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
