EventApp::Application.routes.draw do
  root to: 'navigation_pages#home'

  match '/help',    to: 'navigation_pages#help'
  
  match '/signupcoordinator',  to: 'event_coordinators#new'
  
  match '/signupjudge',  to: 'judges#new'
  
  match '/coordinatorsignin',  to: 'coordinatorsessions#new'
  match '/coordinatorsignout', to: 'coordinatorsessions#destroy', via: :delete
  
  match '/judgesignin',  to: 'judgesessions#new'
  match '/judgesignout', to: 'judgesessions#destroy', via: :delete

  resources :questions

  resources :score_templates do
    resources :questions
  end

  resources :competitors

  resources :score_sheets

  resources :judges 

<<<<<<< HEAD
  resources :events do
    resources :score_templates
  end
=======
  resources :events
>>>>>>> ad793ec346cf4cc6a5566ee0aaea455efb333b6b

  resources :event_coordinators do
    resources :events do
      resources :judges
      resources :competitors
      resources :score_templates do
        resources :questions
      end
    end
  end

  resources :coordinatorsessions, only: [:new, :create, :destroy]
  
  resources :judgesessions, only: [:new, :create, :destroy]

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
