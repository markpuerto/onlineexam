class User < ApplicationRecord
  has_many :posts

  def name
    self.first_name.to_s + " " + self.last_name.to_s
  end
end
