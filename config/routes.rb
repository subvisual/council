Rails.application.routes.draw do
  constraints format: 'json' do
    resources :discussions, only: [:index, :show]
  end

  devise_for :users, controllers: { sessions: 'sessions' }
  root to: 'pages#index'
end
