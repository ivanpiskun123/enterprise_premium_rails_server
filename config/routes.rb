Rails.application.routes.draw do

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  namespace :api do
    namespace :v1 do

      devise_for :users, controllers: {
        sessions: 'api/v1/users/sessions'
      }

      resources :users, only: [:update, :show]


    end
  end

end
