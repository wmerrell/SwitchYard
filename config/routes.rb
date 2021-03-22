# == Route Map
#
#                                   Prefix Verb   URI Pattern                                                                                       Controller#Action
#                                     root GET    /                                                                                                 home#index
#                                    index GET    /index(.:format)                                                                                  home#index
#                                    about GET    /about(.:format)                                                                                  home#about
#                                 postmail POST   /postmail(.:format)                                                                               home#postmail
#                                    users POST   /users(.:format)                                                                                  users#create
#                                 new_user GET    /users/new(.:format)                                                                              users#new
#                                   signup GET    /signup(.:format)                                                                                 users#new
#                                    login GET    /login(.:format)                                                                                  sessions#new
#                                   logout GET    /logout(.:format)                                                                                 sessions#destroy
#                                 sessions POST   /sessions(.:format)                                                                               sessions#create
#                              new_session GET    /sessions/new(.:format)                                                                           sessions#new
#                                  session DELETE /sessions/:id(.:format)                                                                           sessions#destroy
#                          password_resets POST   /password_resets(.:format)                                                                        password_resets#create
#                       new_password_reset GET    /password_resets/new(.:format)                                                                    password_resets#new
#                      edit_password_reset GET    /password_resets/:id/edit(.:format)                                                               password_resets#edit
#                           password_reset PATCH  /password_resets/:id(.:format)                                                                    password_resets#update
#                                          PUT    /password_resets/:id(.:format)                                                                    password_resets#update
#                                 railways GET    /railways(.:format)                                                                               railways#index
#                                          POST   /railways(.:format)                                                                               railways#create
#                              new_railway GET    /railways/new(.:format)                                                                           railways#new
#                             edit_railway GET    /railways/:id/edit(.:format)                                                                      railways#edit
#                                  railway GET    /railways/:id(.:format)                                                                           railways#show
#                                          PATCH  /railways/:id(.:format)                                                                           railways#update
#                                          PUT    /railways/:id(.:format)                                                                           railways#update
#                                          DELETE /railways/:id(.:format)                                                                           railways#destroy
#                                 sections GET    /sections(.:format)                                                                               sections#index
#                                          POST   /sections(.:format)                                                                               sections#create
#                              new_section GET    /sections/new(.:format)                                                                           sections#new
#                             edit_section GET    /sections/:id/edit(.:format)                                                                      sections#edit
#                                  section GET    /sections/:id(.:format)                                                                           sections#show
#                                          PATCH  /sections/:id(.:format)                                                                           sections#update
#                                          PUT    /sections/:id(.:format)                                                                           sections#update
#                                          DELETE /sections/:id(.:format)                                                                           sections#destroy
#                               industries GET    /industries(.:format)                                                                             industries#index
#                                          POST   /industries(.:format)                                                                             industries#create
#                             new_industry GET    /industries/new(.:format)                                                                         industries#new
#                            edit_industry GET    /industries/:id/edit(.:format)                                                                    industries#edit
#                                 industry GET    /industries/:id(.:format)                                                                         industries#show
#                                          PATCH  /industries/:id(.:format)                                                                         industries#update
#                                          PUT    /industries/:id(.:format)                                                                         industries#update
#                                          DELETE /industries/:id(.:format)                                                                         industries#destroy
#                                     page GET    /pages/*id                                                                                        high_voltage/pages#show
#            rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                           action_mailbox/ingresses/postmark/inbound_emails#create
#               rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                              action_mailbox/ingresses/relay/inbound_emails#create
#            rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                           action_mailbox/ingresses/sendgrid/inbound_emails#create
#      rails_mandrill_inbound_health_check GET    /rails/action_mailbox/mandrill/inbound_emails(.:format)                                           action_mailbox/ingresses/mandrill/inbound_emails#health_check
#            rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                           action_mailbox/ingresses/mandrill/inbound_emails#create
#             rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                                       action_mailbox/ingresses/mailgun/inbound_emails#create
#           rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                          rails/conductor/action_mailbox/inbound_emails#index
#                                          POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                          rails/conductor/action_mailbox/inbound_emails#create
#        new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                                      rails/conductor/action_mailbox/inbound_emails#new
#       edit_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                                 rails/conductor/action_mailbox/inbound_emails#edit
#            rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#show
#                                          PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#update
#                                          PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#update
#                                          DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#destroy
# new_rails_conductor_inbound_email_source GET    /rails/conductor/action_mailbox/inbound_emails/sources/new(.:format)                              rails/conductor/action_mailbox/inbound_emails/sources#new
#    rails_conductor_inbound_email_sources POST   /rails/conductor/action_mailbox/inbound_emails/sources(.:format)                                  rails/conductor/action_mailbox/inbound_emails/sources#create
#    rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                               rails/conductor/action_mailbox/reroutes#create
#                       rails_service_blob GET    /rails/active_storage/blobs/redirect/:signed_id/*filename(.:format)                               active_storage/blobs/redirect#show
#                 rails_service_blob_proxy GET    /rails/active_storage/blobs/proxy/:signed_id/*filename(.:format)                                  active_storage/blobs/proxy#show
#                                          GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                                        active_storage/blobs/redirect#show
#                rails_blob_representation GET    /rails/active_storage/representations/redirect/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations/redirect#show
#          rails_blob_representation_proxy GET    /rails/active_storage/representations/proxy/:signed_blob_id/:variation_key/*filename(.:format)    active_storage/representations/proxy#show
#                                          GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format)          active_storage/representations/redirect#show
#                       rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                                       active_storage/disk#show
#                update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                               active_storage/disk#update
#                     rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                                    active_storage/direct_uploads#create

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
  resources :railways, path: 'railways'
  resources :sections, path: 'sections'
  resources :industries
end
