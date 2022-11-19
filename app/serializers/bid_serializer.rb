class BidSerializer
  include JSONAPI::Serializer
  attributes :status

  attribute :resolved_at do |obj|
    obj.resolved_at&.to_date
  end
  attribute :created_at do |obj|
    obj.created_at.to_date
  end

  belongs_to :worker, meta: Proc.new {|obj,p|
    {
      w_first_name: obj.worker.first_name,
      w_second_name: obj.worker.second_name,
      w_position: obj.worker.position.name,
      w_image_url: obj.worker.worker_image.image_url
    }
  }

  belongs_to :user, meta: Proc.new {|obj, p|
    {
      email: obj.user.email
    }
  }

  meta do |obj|
    {
      amount: obj.premium_for_score.amount
    }
  end

end
