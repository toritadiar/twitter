Twitter::Application.routes.draw do
  devise_for :users

  root :to => "pages#index"

  resources :users, only: [:edit, :update, :index]
  resources :tweets

  
  match "/friendships/ask/:friend_id" => "friendships#ask", :as => :friend_ask
  match "/friendships/agree/:friend_id" => "friendships#agree", :as => :friendship_agree
  match "/friendships/reject/:friend_id" => "friendships#reject", :as => :friendship_reject
  match "/friendships/index" => "friendships#index"

  match "/pages/index" => "pages#index"
end
