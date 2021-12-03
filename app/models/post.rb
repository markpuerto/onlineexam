class Post < ApplicationRecord
  belongs_to :user

  scope :collection, -> (opt = {}) {
    if opt[:user_id].present?
      where("is_public = true or user_id = #{opt[:user_id]}")
    else
      where(is_public: true)
    end
  }
end
