# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#                      root GET    /                                                                                        home#index
#                     index GET    /index(.:format)                                                                         home#index
#                     about GET    /about(.:format)                                                                         home#about
#                  postmail POST   /postmail(.:format)                                                                      home#postmail
#                     users POST   /users(.:format)                                                                         users#create
#                  new_user GET    /users/new(.:format)                                                                     users#new
#                    signup GET    /signup(.:format)                                                                        users#new
#                     login GET    /login(.:format)                                                                         sessions#new
#                    logout GET    /logout(.:format)                                                                        sessions#destroy
#                  sessions POST   /sessions(.:format)                                                                      sessions#create
#               new_session GET    /sessions/new(.:format)                                                                  sessions#new
#                   session DELETE /sessions/:id(.:format)                                                                  sessions#destroy
#              sessions_new GET    /sessions/new(.:format)                                                                  sessions#new
#           password_resets POST   /password_resets(.:format)                                                               password_resets#create
#        new_password_reset GET    /password_resets/new(.:format)                                                           password_resets#new
#       edit_password_reset GET    /password_resets/:id/edit(.:format)                                                      password_resets#edit
#            password_reset PATCH  /password_resets/:id(.:format)                                                           password_resets#update
#                           PUT    /password_resets/:id(.:format)                                                           password_resets#update
#                      page GET    /pages/*id                                                                               high_voltage/pages#show
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  # For details on the DSL available within this file, see
  #   http://guides.rubyonrails.org/routing.html
  root 'home#index'

  get  '/index' => 'home#index', as: :index
  get  '/about' => 'home#about', as: :about
  post '/postmail' => 'home#postmail', as: :postmail

  resources :users, only: [:new, :create]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions, only: [:new, :create, :destroy]
  get 'sessions/new'
  resources :password_resets, only: [:new, :create, :edit, :update]
end
