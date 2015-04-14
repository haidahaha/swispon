Rails.application.routes.draw do

  root 'sessions#new'
  get 'about' => 'static_pages#about'
  get 'signup' => 'doctors#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'reports' => 'reports#index'
  get 'reports/:id' => 'reports#show', as: :report
  patch 'reports/:id/upload_photos' => 'reports#upload_photos', as: :upload_photos
  delete 'reports/:id/destroy_photos' => 'reports#destroy_photos', as: :destroy_photos
  delete 'photos/:id/destroy' => 'photos#destroy', as: :destroy_photo
  get 'records/:id' => 'records#show', as: :record
  patch 'records/:id/create_note' => 'records#create_note', as: :create_note

  resources :doctors
end
