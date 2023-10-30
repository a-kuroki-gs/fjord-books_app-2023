Rails.application.routes.draw do
  resources :books

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get       'users/sign_out', to:     'devise/sessions#destroy'
    get       'users',          to:     'users#index',                   as: :users
    post      'users',          to:     'users/registrations#create'
    get       'users/:id/edit', to:     'users/registrations#edit',      as: :edit_user
    get       'users/:id',      to:     'users#show',                    as: :user
    patch     'users/:id',      to:     'users/registrations#update'
    delete    'users/:id',      to:     'users#destroy'
  end

  root 'books#index'

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
