# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
  get '/member-data', to: 'members#show'
  get '/show_plans', to: 'account_tier_types#index'
  get '/show_timeable_objects', to: 'timeable_object#index'
  post '/update_user_info', to: 'users/config#update_user_info', defaults: { format: :json }
  post '/create_timeable_obejct', to: 'timeable_object#create', defaults: { format: :json }
end
