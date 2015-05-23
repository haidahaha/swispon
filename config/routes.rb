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
  patch 'reports/:id/submit' => 'reports#submit', as: :submit_report
  get 'reports/:id/download' => 'reports#download', as: :download_report
  delete 'photos/:id/destroy' => 'photos#destroy', as: :destroy_photo
  get 'records/:id' => 'records#show', as: :record
  get 'records/:id/note' => 'records#note', as: :record_note
  patch 'records/:id/create_note' => 'records#create_note', as: :create_note

  get 'reset' => 'application#reset'

  resources :doctors

  #api
  namespace :api do
    namespace :v1 do
      get 'doctors/:id' => 'doctors#show'
      get 'getReport/:id' => 'reports#show'
      get 'listUnfinishedReports' => 'reports#indexUnfinished'
      post 'createReport' => 'reports#create'
      post 'saveReport' => 'reports#update'
      get 'getImage/:id' => 'photos#show'
      get 'getAudio/:id' => 'record#showAudio'
      post 'uploadAudio' => 'records#createAudio'
    end
  end
end
