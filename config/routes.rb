Rails.application.routes.draw do
  get '/profile', to: 'profile#show'

  get 'profile/settings'

  get 'settings/profile', to: 'settings#profile'

  get  'settings/password', to: 'settings#password'
  post 'settings/password', to: 'settings#save_password'

  get 'settings/2fa', to: 'settings#two_factor'

  get 'settings/enable-2fa', to: 'settings#show_enable_two_factor'
  post 'settings/enable-2fa', to: 'settings#enable_two_factor'

  get 'settings/disable-2fa', to: 'settings#show_disable_two_factor'
  post 'settings/disable-2fa', to: 'settings#disable_two_factor'


  get 'settings', to: 'settings#show'

  root 'home#index'
  get '/login', to: 'login#index'
  get '/login/two_factor', to: 'login#two_factor'
  post '/login', to: 'session#create'
  post '/two_factor', to: 'session#two_factor'
  get '/logout', to: 'session#destroy'

  resources :users
  resources :victims
  resources :offenses

  get '/offenses/type/:offense_type_slug', to: 'offenses#index_with_offense_type', as: :offenses_type

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
