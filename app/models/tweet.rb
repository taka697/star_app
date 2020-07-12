class Tweet < ApplicationRecord
  has_many :favorites
  has_many :comments
  belongs_to :user

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def commented_by?(user)
    comments.where(user_id: user.id).exists?
  end
end
