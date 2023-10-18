Rails.application.routes.draw do
  resources :books

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get       'users/sign_out', to:     'devise/sessions#destroy'
    post      'users',          to:     'users/registrations#create'
    get       'users/:id/edit', to:     'users/registrations#edit',      as: :edit_user
    patch     'users/:id',      to:     'users/registrations#update'
    delete    'users/:id',      to:     'users#destroy'
  end

  root 'books#index'
end
