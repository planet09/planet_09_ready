Rails.application.routes.draw do
  resources :dummyranks
  resources :comments
  resources :banks
  resources :orders
  get 'tinymce_assets/create'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
    match 'users/info' => 'users/registrations#info', via: [:get, :patch]
    #get 'users/info' => 'users/registrations#info'
  end


  root 'posts#index'

  get 'posts/group' => 'posts#group'


  post 'posts/:id/order' => 'posts#order'
  post 'posts/:id/buy' => 'orders#buy'
  post 'posts/:id/admin' => 'orders#admin'

  get 'admins/mypage' => 'admins#mypage'
  get 'ranks/rank' => 'ranks#rank'
  #안드로이드 코드
  get '/sendData/:money/:name'=> 'posts#read'


  resources :posts
  put '/posts/:post_id/like' => 'likes#create'
  delete '/posts/:post_id/like' => 'likes#destroy'
  post '/posts/:post_id/comments' => 'comments#create'
  delete '/comments/:id' => 'comments#destroy', as: 'destroy_comment'

  post '/tinymce_assets' => 'tinymce_assets#create'

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
