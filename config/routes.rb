Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :events do
    resources :event_attendees, only: :create
    resources :reviews, only: [:create] do
      resources :comments, only: [:create, :destroy]
    end
    resources :comments, only: [:new, :create, :destroy]
  end
  resources :event_attendees, only: :destroy
end
