Rails.application.routes.draw do
  root "dashboards#index"

  resources :sessions, only: [:create, :new]
  resource :session, only: :destroy
  resources :activities, only: [:index, :create] do
    resources :activity_approvals, only: :create
  end
end
