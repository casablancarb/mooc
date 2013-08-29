SnabbspolaSe::Application.routes.draw do
  root 'pages#studies'

  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
  get 'register' => 'users#new'

  get 'studies' => 'pages#studies'

  resources :sessions, :only => [:create]
  resources :users

  get 'admin' => 'admin/courses#index'
  get 'teaching' => 'admin/courses#index' #TODO: This oughta replace the above

  get 'courses/:id/join' => 'admissions#new', as: 'join_course'
  post 'courses/:id/request_join' => 'admissions#create', as: 'request_join_course'
  resources :courses, only: [:index, :show]
  namespace :admin do
    resources :courses do
      resources :sections, except: [:index]
    end
    resources :sections, only:[] do
      resources :exercises, except:[:index]
    end
    resources :exercises, only:[] do
      resources :questions, only:[:new, :create]
    end
    resources :exercises, except:[:new, :create]
  end

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
