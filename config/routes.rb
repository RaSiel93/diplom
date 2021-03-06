Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  root 'schedules#show'

  resources :form_journals
  resource :schedule
  resource :statistic

  resources :forms do
    resources :subjects do
      resources :marks
    end
  end
end
