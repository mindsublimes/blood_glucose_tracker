Rails.application.routes.draw do
  root "glucose_readings#index"
  devise_for :users
  resources :glucose_readings
  resources :reports, only: [:index] do
    collection do
      post :filter_report
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
