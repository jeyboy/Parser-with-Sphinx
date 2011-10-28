SphinksTest::Application.routes.draw do

  get "comments/create"

  devise_for :admins
  devise_for :users

  get "t_canvas/index"
  get "t_canvas/build"

  get "twit/index"
  get "twit/new"
  get "twit/create"

  root :to => "news_items#index"

  resources :search do
    get 'by_topic', :on => :member, :as => 'topic'
    get 'by_request', :on => :collection, :as => 'request'
  end

  resources :categories, :only => [] do
    resources :topics, :only => [] do
      get 'news', :on => :member, :to => 'search#by_topic'
    end
  end

  get "news_items/index"
  get "news_items/show/:id", :as => :show_news, :to => "news_items#show"
  get "news_items/load"
  get "news_items/load_last"
  get "news_items/change_rating"
end
