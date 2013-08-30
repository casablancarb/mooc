SnabbspolaSe::Application.routes.draw do
  root 'pages#studies'

  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
  get 'register' => 'users#new'

  get 'studies' => 'pages#studies'

  resources :sessions, :only => [:create]
  resources :users

  resources :sections, :only => [:show]
  resources :exercises, :only => [:show]
  
  post 'questions/:id/answer' => 'answers#create', as: 'question_answers'

  get 'admin' => 'admin/courses#index'
  get 'teaching' => 'admin/courses#index' #TODO: This oughta replace the above

  get 'courses/:id/join' => 'admissions#new', as: 'join_course'
  post 'courses/:id/request_join' => 'admissions#create', as: 'request_join_course'
  resources :courses, only: [:index, :show]
  namespace :admin do
    resources :courses do
      resources :sections, except: [:index]
    end
    post 'sections/:id/up' => 'sections#up', as: 'section_up'
    post 'sections/:id/down' => 'sections#down', as: 'section_down'
    resources :sections, only:[] do
      resources :exercises, except:[:index]
    end
    resources :exercises, only:[] do
      resources :questions, only:[:new, :create, :update, :index]
    end
    post 'exercises/:id/up' => 'exercises#up', as: 'exercise_up'
    post 'exercises/:id/down' => 'exercises#down', as: 'exercise_down'
    resources :questions, except:[:new, :create, :update]
    post 'questions/:id/up' => 'questions#up', as: 'question_up'
    post 'questions/:id/down' => 'questions#down', as: 'question_down'
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
