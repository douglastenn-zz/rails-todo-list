Rails.application.routes.draw do

  root :to => 'users#index'

  # Criar todas as rotas necessárias para o CRUD de usuários
  resources :users

  # Criar todas as rotas necessárias para o CRUD de tasks
  resources :tasks

end
