require 'api_constraints'

Cukis::Application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: :true) do
      resources :posts, only: [:index, :show] do
        resources :comments, only: [:create, :destroy]
      end

      resources :notes, only: [:index, :show] do
        resources :messages
      end

      devise_scope :user do
        resources :sessions, only: [:create, :destroy]
        post 'registrations' => 'registrations#create'
      end

      get 'register_openfire' => 'main#register_openfire'
      get 'check_phone' => 'main#check_phone'
    end
  end

  root to: "dayclasses#index"

  match "/wait", to:"main#wait"
  match "/prelogin", to: "main#prelogin"
  match "/preregister", to: "main#preregister"
  match "/privacy", to: "main#privacy"
  match "/agreement", to: "main#agreement"
  match "/introduce", to: "main#introduce"
  match "/question", to: "main#question"

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :clients, path_names: {sign_in: 'login', sign_out: 'logout'}

  devise_for :users, path_names: {sign_in: 'login', sign_out: 'logout'}
  resources :users, only: [:show]

  resources :postacts

  resources :dayclasses do
    resources :replies
    resources :attendships, only: [:new, :create, :destroy] do
      collection do
        get 'success'
      end
    end
    collection do
      get 'waitmento'
    end

    member do
      get 'success'
    end
  end

  resources :articles, only: [:show] do
    resources :replies
  end

  resources :schoolinfos, only: [:index, :show] do
    resources :articles, only: [:show]
    member do
      get 'stats'
    end
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
