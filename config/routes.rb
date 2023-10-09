Rails.application.routes.draw do
  root "dashboards#index"

  resources :sessions, only: [:create, :new]
  resource :session, only: :destroy
  resources :activities, only: [:index, :create, :destroy] do
    resources :activity_approvals, only: :create
  end

  resources :bulk_activities_approvals, only: :create
end
