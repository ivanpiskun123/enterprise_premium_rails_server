module Imagable
  extend ActiveSupport::Concern

  included do
    has_one :worker_image, :as => :reference
  end
end
