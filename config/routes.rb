Rails.application.routes.draw do

  root 'user#index'

  get 'user/:id/filter' => 'user#filter',as: :filter_users
  post 'user/:id/filter' => 'user#filter',as: :filter_users_view
  post 'user/:id/upload' => 'user#upload',as: :upload_users
  get 'user/:id/show' => 'user#showuploads',as: :showuploads_users
  get 'user/:id/index' => "user#index", as: :index_user

  get 'user/:id/profile' => "user#profile",as: :profile_user
  get 'user/:id/compose_message' => "message#new",as: :compose_message
  post 'user/:id/compose_message' => "message#create",as: :create_message
  get 'user/:id/compose_notification' => "notification#new",as: :compose_notifications
  get 'user/:id/show_messages' => 'message#show',as: :show_messages

  get 'message/:id/filter' => 'message#filter',as: :filter_message
  post 'message/:id/filter' => 'message#filter',as: :filter_message_view





  # Example of regular route:
  get 'users/signinform' => 'user#signinform'
  get 'users/register' => 'user#register'
  get 'users/signin' => 'user#signin'
  get 'users/forgot_password' => 'user#forgot_password'
  post 'users/register' => 'user#register'
  post 'users/signin' => 'user#signin'
  post 'users/forgot_password' => 'user#forgot_password'
  get 'users/reset_password' => 'user#reset_password'
  post 'users/reset_password' => 'user#reset_password'
  get 'users/reset_password_form' => 'user#reset_password_form'
  post 'users/reset_password_form' => 'user#reset_password_form'


  resources :user do
    member do
      get :confirm_email
      get :verify_link
    end
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
