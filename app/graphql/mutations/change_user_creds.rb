module Mutations
  class ChangeUserCreds < BaseMutation
    argument :user_id, Int, required: true
    argument :email, String, required: true
    argument :current_password, String, required: true
    argument :password, String, required: true

    field :user, Types::UserType, null: true
    field :errors, [String], null: false

    def resolve(user_id:, email:, current_password:, password:)
      begin
        user = User.find(user_id)
        user.update_with_password( password: password, password_confirmation: password, current_password: current_password)
        user.update!(email: email)
        { user: user, errors: [] }
      rescue => error
        GraphQL::ExecutionError.new("#{error.record.errors.full_messages.first}")
      end
    end
  end
end
