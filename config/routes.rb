Rails.application.routes.draw do
  root 'home#index'
  get 'home/most_popular'

  post :home, to: 'home#create_shortened_url', as: :create_shortened_url
  get '/:short_url', to: 'home#visit_shortened_url'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
