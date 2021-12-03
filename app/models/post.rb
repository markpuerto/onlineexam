class Post < ApplicationRecord
  belongs_to :user

  scope :collection, -> (opt = {}) {
    if opt[:user_id].present?
      where("is_public = true or user_id = #{opt[:user_id]}").order(created_at: :desc)
    else
      where(is_public: true).order(created_at: :desc)
    end
  }
end
