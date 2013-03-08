require 'sidekiq/web'

Launchvn::Application.routes.draw do

  mount Sidekiq::Web, at: '/sidekiq'

  devise_scope :user do
    get '/auth/:provider' => 'users/omniauth_callbacks#passthru'
  end
  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks",
    :registrations => "users/registrations"
  }
  resources :users, only: [:show]
  match '/new' => 'upload#index'
  match '/streamsessions/generate' => 'streamsessions#generate'
  
  post '/upload/status'
  get '/upload/job'

  put '/slide/edit' => 'slide#edit'
  get '/:username/:slug' => 'slide#index', :as => "slide_index"

  # home
  root :to => "home#index"
  get '/browse' => 'home#browse', as: :browse

  # follow
  controller :follows do
    post '/follows/follow' => :follow, as: :create_follow
    post '/follows/unfollow' => :unfollow, as: :create_unfollow
    get '/follows/following' => :following, as: :following
  end

  #streaming
  get '/stream/:username/:sessionid' => 'streamsessions#index'

end
