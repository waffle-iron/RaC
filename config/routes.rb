Rails.application.routes.draw do
  resources :agreements do
    member do

      resources :agreement_zones, as: :agreement_zones,  only: [] do
        collection do
          get '/add_remove_zone/:zone_id', to: :add_remove_zone, as: :add_remove
          get 'show/:zone_id', to: :show, as: :show
          get 'edit/:zone_id', to: :edit, as: :edit
          get '/add_remove_zone_group/:zone_id/group/:group_letter', to: 'agreement_zone_groups#add_remove_group', as: :add_remove_group
          get '/add_remove_zone_group/:zone_id/group_section/:section', to: 'agreement_zone_group_sections#add_remove', as: :add_remove_group_section
        end
      end
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
