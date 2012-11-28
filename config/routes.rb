Facebook::Application.routes.draw do

  root :to => 'welcome#home'
  match "/auth/:provider/callback" => "sessions#create"
end
