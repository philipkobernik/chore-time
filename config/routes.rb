ChoreTime::Application.routes.draw do

  match '/auth/facebook/callback', to: 'sessions#create'

  root :to => 'pages#home'
end
