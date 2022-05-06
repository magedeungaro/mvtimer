# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  resources :account_tier_types, path: :plans, only: :index, defaults: { format: :json }
  resources :timeable_objects, path: :cards, only: %i[index update delete create], defaults: { format: :json }
  resources :timeable_object_logs, path: :timers, only: %i[index create], defaults: { format: :json }

  post '/update_user_info', to: 'users/config#update_user_info', defaults: { format: :json }
end
