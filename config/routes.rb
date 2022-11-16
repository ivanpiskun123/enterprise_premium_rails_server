Rails.application.routes.draw do

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

    end

    namespace :v2 do
      post "/graphql", to: "graphql#execute"
    end
  end

end
