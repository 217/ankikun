# なるべく、RESTfulなルーティングを心がけた。
Ankikun::Application.routes.draw do 
  get "ask/update"

  devise_for :users

  get "home/index", :as => :user_root

  # wikiのルーティング
  # これでないとバグが発生する
  get "wiki/index"
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
  # Wikiの子ページのルーティング
	match "wiki/:id/:sub_id/edit" => "wiki#edit"
	match "wiki/:id/:sub_id/update" => "wiki#update"
	match "wiki/:id/:sub_id/destroy" => "wiki#destroy"
	match "wiki/:id/:sub_id/show" => "wiki#show"

  get "ask/new"

  get "ask/create"
	post "ask/create"

  get "ask/index"

  get "ask/show"

	get "ask/update"

  get "exam/new"
  get "exam/create"

	post "exam/create"

  get "exam/index"

  get "exam/edit"

  get "exam/destroy"

	get "exam/check"
	post "exam/check"
	
	# examのページのルーティング
	match "exam/:id/show" => "exam#show"
	match "exam/:id/check" => "exam#check"
	match "exam/:id/destroy" => "exam#destroy"
	match "exam/:id/edit" => "exam#edit"

	# Askのページのルーティング
	match "ask/:id/show" => "ask#show"
	match "ask/:id/create" => "ask#create"
	match "ask/:id/update" => "ask#update"

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
	root :to => "home#index"
end
