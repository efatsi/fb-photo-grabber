Facebook::Application.routes.draw do
  mount StatBoard::Engine, :at => "/stats"

  resource :user

  match 'wall_pics' => 'photos#wall'
  match 'profile_pics' => 'photos#profile'
  match 'friend_pics' => 'photos#friends'

  match 'logout' => 'sessions#destroy'
  match '/auth/:provider/callback' => 'sessions#create'

  root :to => 'welcome#home'

end
