Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  root to: "home#index"
  resources :projects
  post 'projects/:id/file_upload', to: 'projects#upload', as: 'projects_file_upload'
end
