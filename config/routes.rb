Rails.application.routes.draw do
  get 'events/index'
  post 'events' =>  'events#create'
  get 'events/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
