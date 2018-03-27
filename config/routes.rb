Rails.application.routes.draw do
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root :to => "posts#index"

  post "reply_new" => "posts#reply_new" 
  post "post_new" => "posts#create" 
  get "list_reply" => "posts#list_reply" 
end
