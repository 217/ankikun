Ankikun::Application.routes.draw do
  get "ask/new"

  get "ask/create"
	post "ask/create"

  get "ask/index"

  get "ask/show"

  get "welcome/index", :as => :welcome

  devise_for :users

  get "sessions/callback"
	
  get "test/new"
  get "test/create"

	post "test/create"

  get "test/index"

  get "test/edit"

  get "test/destroy"

	get "test/check"
	post "test/check"

	# Deviseログイン直後の戻り先user_rootを指定
  get "wiki/index", :as => :user_root

  get "wiki/show"

  get "wiki/new"
	post "wiki/new"

  get "wiki/create"
	post "wiki/create"

  get "wiki/edit"

  get "wiki/update"

  get "wiki/destroy"

	# Wikiのトップページのルーティング
	match "wiki/:id/index" => "wiki#index"
	match "wiki/:id/new" => "wiki#new"
	match "wiki/:id/create" => "wiki#create"
	match "wiki/:id/edit" => "wiki#edit"
	match "wiki/:id/update" => "wiki#update"
	match "wiki/:id/destroy" => "wiki#destroy"

	# Wikiのページのルーティング
	match "wiki/:id/:sub_id/edit" => "wiki#edit"
	match "wiki/:id/:sub_id/update" => "wiki#update"
	match "wiki/:id/:sub_id/destroy" => "wiki#destroy"
	match "wiki/:id/:sub_id/show" => "wiki#show"

	# Twitter、Facebookのルーティング
	match "/auth/:provider/callback" => "sessions#callback"
	match "/logout" => "sessions#destroy", :as => :logout
	
	# Testのページのルーティング
	match "test/:id/show" => "test#show"
	match "test/:id/check" => "test#check"

	# Askのページのルーティング
	match "ask/:id/show" => "ask#show"

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
	#
	root :to => "wiki#new"
end
