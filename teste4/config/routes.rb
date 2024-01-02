# frozen_string_literal: true

Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check
  get 'csv_importer/import'
  resources :titles
  post 'csv_importer/import', to: 'csv_importer#import'
  post 'csv_importer', to: 'csv_importer#create' 
 
end
