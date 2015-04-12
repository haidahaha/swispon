Rails.application.routes.draw do
  delete 'photos/:id/destroy' => 'photos#destroy', as: :destroy_photo
  delete 'doctors/:id/destroy_photos' => 'doctors#destroy_photos', as: :destroy_photos

  root 'sessions#new'
  get 'about' => 'static_pages#about'
  get 'signup' => 'doctors#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  patch 'doctors/:id/upload_photos' => 'doctors#upload_photos', as: :upload_photos
  patch 'doctorcs/:id/create_note' => 'doctors#create_note', as: :create_note

  resources :doctors
end
