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
#           password_resets POST   /password_resets(.:format)                                                               password_resets#create
#        new_password_reset GET    /password_resets/new(.:format)                                                           password_resets#new
#       edit_password_reset GET    /password_resets/:id/edit(.:format)                                                      password_resets#edit
#            password_reset PATCH  /password_resets/:id(.:format)                                                           password_resets#update
#                           PUT    /password_resets/:id(.:format)                                                           password_resets#update
#                sy_layouts GET    /layouts(.:format)                                                                       sy_layouts#index
#                           POST   /layouts(.:format)                                                                       sy_layouts#create
#             new_sy_layout GET    /layouts/new(.:format)                                                                   sy_layouts#new
#            edit_sy_layout GET    /layouts/:id/edit(.:format)                                                              sy_layouts#edit
#                 sy_layout GET    /layouts/:id(.:format)                                                                   sy_layouts#show
#                           PATCH  /layouts/:id(.:format)                                                                   sy_layouts#update
#                           PUT    /layouts/:id(.:format)                                                                   sy_layouts#update
#                           DELETE /layouts/:id(.:format)                                                                   sy_layouts#destroy
#                sy_modules GET    /modules(.:format)                                                                       sy_modules#index
#                           POST   /modules(.:format)                                                                       sy_modules#create
#             new_sy_module GET    /modules/new(.:format)                                                                   sy_modules#new
#            edit_sy_module GET    /modules/:id/edit(.:format)                                                              sy_modules#edit
#                 sy_module GET    /modules/:id(.:format)                                                                   sy_modules#show
#                           PATCH  /modules/:id(.:format)                                                                   sy_modules#update
#                           PUT    /modules/:id(.:format)                                                                   sy_modules#update
#                           DELETE /modules/:id(.:format)                                                                   sy_modules#destroy
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

  # User Management Routes
  resources :users, only: [:new, :create]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :sessions, only: [:new, :create, :destroy]
  resources :password_resets, only: [:new, :create, :edit, :update]

  # Start of Working Routes
  resources :sy_layouts, path: 'layouts'
  resources :sy_modules, path: 'modules'
end
