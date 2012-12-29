require 'api_constraints'

Cukis::Application.routes.draw do
  resources :tests

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

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

  root to: "main#home"

  match "/teaching", to: "main#teaching"
  match "/teacher", to:"main#teacher"
  match "/teamact", to:"main#teamact"
  match "/campuskids", to:"main#campuskids"
  match "/campuskids/school", to:"main#campuskids_school"
  match "/dayclass", to:"main#dayclass"
  match "/campuskids/school/stats", to:"main#schoolstat"
  match "/joinact", to:"main#joinact"
  match "/mypage", to:"main#mypage"
  match "/account", to:"main#mypage_account"
  match "/pay", to:"main#mypage_pay"
  match "/sessions", to:"main#mypage_sessions"

  #test 용 라우팅입니다. 테스트후 삭제해주세요.

  match "/test", to:"main#test" 

  #------------------------------------------------ 

  devise_for :clients

  devise_for :users, path_names: {sign_in: 'login', sign_out: 'logout'}

  resources :postacts

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
