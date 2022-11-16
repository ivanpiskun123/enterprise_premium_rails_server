module Mutations
  class ChangeOrCreateUserImage < BaseMutation
    argument :image_url, String, required: true
    argument :user_id, Int, required: true

    field :worker_image, Types::WorkerImageType, null: true
    field :errors, [String], null: false

    def resolve(image_url:, user_id:)
      begin
        user = User.find(user_id)
        if user_image = user.worker_image
          user_image.update(image_url: image_url)
        else
          user_image = WorkerImage.create(image_url: image_url, reference: user)
        end
        { worker_image: user_image, errors: [] }
      rescue => error
        { worker_image: nil, errors: error.message }
      end
    end
  end
end
