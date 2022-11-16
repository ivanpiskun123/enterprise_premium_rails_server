module Types
  class MutationType < Types::BaseObject

    field :change_user_creds, mutation: Mutations::ChangeUserCreds
    field :change_or_create_user_image, mutation: Mutations::ChangeOrCreateUserImage

  end
end
