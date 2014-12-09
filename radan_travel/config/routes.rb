Rails.application.routes.draw do
  
  mount Ckeditor::Engine => '/ckeditor'
  scope "(:locale)", :locale => /en|fa|ar/ do  
    resources :slides

    resources :planes
    resources :hotels do
      collection do
        get :dynamic_city
      end
    end

    resources :cities do
      collection do
        get :dynamic_city
      end
    end
    resources :countries

    resources :tours do
      collection do
        post :search 
        get :tours_moment
      end
      member do
        get :sendtonewsletter
      end
    end

    resources :photos

    resources :sights

    resources :links

    resources :roles

    devise_for :users
      
    resources :users

    resources :pages
    resources :send_links

    resources :customers do
      collection do
        post :search
        post :send_email_to_all
      end
    end

    resources :messages

    resources :tour_comments do
        member do
          get :confirm
        end
      end

  end
  
  root :to => 'static#home'
  get "index" => 'static#index'
  get "google46bde3a8d7d48d7d" => 'static#google46bde3a8d7d48d7d'
  get "sitemap.xml" => "static#sitemap", :format => "xml", :as => :sitemap
  
  
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
