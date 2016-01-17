Rails.application.routes.draw do
  root 'sessions#new'
  get 'sessions/new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
	get 'questions/show'
	get 'questions/manage'
	get 'questions/ban'
	post 'questions/like'
	get 'questions/like'
	post'questions/ban'
	get 'questions/ban'
	get 'users/information'
	post'questions/search'
	get 'questions/search'
	post'questions/addquestion'
	get 'answers/reply'
	post 'answers/like'
	get 'answers/like'
	post 'answers/reply'
	get 'answers/reply'
	post 'articles/upload'
	post 'articles/download'
	get 'articles/download'
	post'answers/reply'
	post 'questions/addanswer'
	post 'users/search'
  get  'signup' => 'users#new'

  
  resources :articles
  resources :likes
  resources :fields
  resources :answers
  resources :questions
  resources :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
