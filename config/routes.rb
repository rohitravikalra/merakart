Rails.application.routes.draw do
  root to: 'static_pages#home'
  get '/about_us' => 'static_pages#about_us'
  get '/store' => 'static_pages#store_grid'
  get '/show_product' => 'static_pages#product_page'
  get '/add-to-cart' => 'static_pages#add_to_cart'
  get '/session-clear' => 'application#clear_session'
  get '/review' => 'static_pages#review'
  get '/checkout' => 'static_pages#checkout'
  get '/modify-cart' => 'static_pages#modify_cart'
  get '/payment' => 'static_pages#payment'
  get '/place-order' => 'static_pages#place_order'
  get '/contact-us' => 'static_pages#contact_us'
  post '/queries' => 'static_pages#queries'

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
