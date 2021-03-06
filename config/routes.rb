Rails.application.routes.draw do
  resources :booking_builders,  only: [:new, :create] do
    collection do
      get :select_zone, action: :select_zone
      get '/:zone_id/select_ttoo/', action: :select_ttoo, as: :select_ttoo
      get '/:zone_id/new/:ttoo_id', action: :new, as: :new
      post '/:zone_id/new_select_insurances/:ttoo_id', action: :new_select_insurances, as: :new_select_insurances
      post '/:zone_id/total/:ttoo_id', action: :total, as: :total
      post '/:zone_id/create/:ttoo_id', action: :create, as: :create
    end
  end
  resources :customers
  resources :nationalities
  resources :place_types
  resources :treatment_types
  resources :rates
  resources :sale_types
  resources :agreements do
    resources :rates
    get '/add_remove_extra/:extra_id', to: 'agreement_extras#add_remove', as: :add_remove_extra
    get '/add_remove_group_section/:section', to: 'agreement_group_sections#add_remove', as: :add_remove_group_section
    get '/add_remove_group/:group_letter', to: 'agreement_groups#add_remove', as: :add_remove_group
    get '/add_remove_tax/:tax_id', to: 'agreement_taxes#add_remove', as: :add_remove_tax
    get '/add_remove_insurance/:insurance_id', to: 'agreement_insurances#add_remove', as: :add_remove_insurance



    resources :agreement_zones, as: :zones, only: [:show, :edit] do
      resources :rates
      get '/add_remove_zone', to: :add_remove, as: :add_remove
      get '/add_remove_zone_group/:group_letter', to: 'agreement_zone_groups#add_remove_group', as: :add_remove_group
      get '/add_remove_zone_group_section/:section', to: 'agreement_zone_group_sections#add_remove', as: :add_remove_group_section
      get '/add_remove_tax/:tax_id', to: 'agreement_zone_taxes#add_remove', as: :add_remove_tax
      get '/add_remove_insurance/:insurance_id', to: 'agreement_zone_insurances#add_remove', as: :add_remove_insurance
      get '/add_remove_extra/:extra_id', to: 'agreement_zone_extras#add_remove', as: :add_remove_extra
      resources :bookings
    end
  end
  resources :insurances
  resources :zones
  resources :extras

  resources :taxes
  resources :zones
  resources :companies
  resources :users
  resources :type_categories
  devise_for :users, :path => 'devise'
  root :to => "admin#index"
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
