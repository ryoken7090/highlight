Rails.application.routes.draw do
  resources :memos
  get 'hello' => 'posts#hello'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
