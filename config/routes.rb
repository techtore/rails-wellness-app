Rails.application.routes.draw do
  root "application#home"

  get 'entries/keyword_search', to: 'entries#search', as: 'keyword_search'
  get 'topics/reverse_order', to: 'topics#reverse_order', as: 'reverse_order'
  
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks'}
  devise_scope :user do 
    get 'login', to: "devise/sessions#new"
    get 'signup', to: "devise/registrations#new"
    
  end
  resources :entries

  resources :topics do
    resources :entries, only: [:new, :create, :show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
