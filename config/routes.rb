SphinksTest::Application.routes.draw do

  get "comments/create"

  devise_for :admins

  devise_for :users

  get "t_canvas/index"
  get "t_canvas/build"

  get "twit/index"
  get "twit/new"
  get "twit/create"

  root :to => "newses#index"

  resources :search do
    get 'by_topic', :on => :member, :as => 'topic'
    get 'by_request', :on => :collection, :as => 'request'
  end

  resources :categories, :only => [] do
    resources :topics, :only => [] do
      get 'news', :on => :member, :to => 'search#by_topic'
    end
  end

  get "newses/index"
  get "newses/show/:id", :as => :show_newses, :to => "newses#show"
  get "newses/load"
  get "newses/load_last"
  get "newses/change_rating"
end
