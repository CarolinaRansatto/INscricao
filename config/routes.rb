Rails.application.routes.draw do


  resources :cadastro_es, only: [:index, :new, :create, :edit, :update]
  get 'cadastro_es/success', as: :ce_success
  resources :candidatos, only: [:index, :new, :create, :edit, :update]
  resources :data_dinamicas, only: [:create, :update, :destroy]
  resources :cursos, only: [:create, :update, :destroy]
  get 'candidatos/success', as: :ps_success
  get 'candidatos/configurar', as: :ps_config

  get '/login', 			to: 'sessoes#new'
  post '/login', 			to: 'sessoes#create'
  delete '/logout', 		to: 'sessoes#destroy'



  # get '/ps', 				to: 'candidatos#new', 		as: :new_candidato
  # post '/ps', 				to: 'candidatos#create',	as: :create_candidato
  # get '/ps/s/:token',		to: 'candidatos#success', 	as: :success
  # get '/ps/:id/:token', 	to: 'candidatos#edit',		as: :edit_candidato
  # patch '/ps/:id/:token', 	to: 'candidatos#update',	as: :update_candidato
  # put '/ps/:id/:token', 	to: 'candidatos#update'
  # get '/datas',				to: 'data_dinamicas#index'

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
