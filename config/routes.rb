Rails.application.routes.draw do
  root 'welcome#index'
  resources :user_replies
  resources :online_tests , only: [:show] do
    resources :questions do
      collection do
        get :statistics
      end
        resources :answers
    end
  end

  namespace :admin do
    resources :online_tests do
      resources :questions do
        resources :answers
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
