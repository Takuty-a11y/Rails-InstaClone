class Post < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :comments, -> { order(created_at: :desc) }, dependent: :destroy
  
  accepts_nested_attributes_for :photos
  
  # user_idとpost_idが一致するlikeを検索する
  def liked_by(user)
    Like.find_by(user_id: user.id, post_id: id)
  end
end
