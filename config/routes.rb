Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get 'premium_for_scores/index'
    end
  end
  namespace :api do
    namespace :v1 do
      get 'worker_achievements/index'
    end
  end
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/api/v2/graphql"
  end

  namespace :api do
    namespace :v1 do
      devise_for :users, controllers: {
        sessions: 'api/v1/users/sessions'
      }
      resources :users, only: [:update, :show]
      resources :achievements, only: [:index]
      resources :workers, only: [:index] do
        collection do
          get 'deactivate_achievements'
        end
      end
      resources :worker_achievements, only: [:index, :create]
      resources :bids, only: [:create, :index, :update] do
        collection do
          get 'reject'
          get 'apply'
        end
      end

      resources :premium_for_scores, only: [:index] do
        collection do
          get 'minimal_premium'
        end
      end

    end

    namespace :v2 do
      post "/graphql", to: "graphql#execute"
    end
  end

end
