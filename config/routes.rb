Oenglish::Application.routes.draw do
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  
  devise_for :users, :sign_out_via => [ :post, :delete , :get],  :controllers => {
      registrations: :registrations,
      sessions: :sessions,
      passwords: :passwords
  }
  
  namespace :admin do 
    root "users#index"
    resources :users do
      get :set_grade, :on => :member
      post :do_set, :on => :member
    end
    resources :agents
    resources :courses
    resources :lessons
    resources :grades
    resources :schedules do
      get :meeting, :on => :member
      get :webex, :on => :member
    end
    resources :coursewares
  end
  
  namespace :agent do
    root "students#index"
    resources :students
  end
  
  namespace :teacher do
    root "schedules#index"
    resources :schedules
  end
  
  namespace :student do
    root "courses#index"
    resources :courses
    resources :schedules do
      get :enroll,  :on => :collection
    end
    resources :coursewares
  end
  
  

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
