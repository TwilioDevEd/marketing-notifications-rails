Rails.application.routes.draw do
  post 'incoming/' => 'notifications#incoming'
  post 'new/' => 'notifications#new'
  root 'notifications#index'
end
