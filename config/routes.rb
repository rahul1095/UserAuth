Rails.application.routes.draw do
  resources :regions
  resources :nodes
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :places
  resources :images
  resources :cities do
    collection do
      get :get_cities
      end
      member do
       get :show_page
      end
       member do
      get :edit_city
    end
  end 
  resources :states do
    collection do
      get :get_states
    end
    member do 
      get :edit_country
    end 
    member do
    get :show_page
    end
   end 

  resources :countries do
    member do 
      get :edit_country
    end 
    member do
      get :show_page
    end
  end
  resources :user_regions
  resources :user_roles
  resources :companies
  resources :manages
  devise_for :users
  root 'companies#index'
  # get 'get_states' => "states#get_states"
  #  get 'get_cities' => "cities#get_cities"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
