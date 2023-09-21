class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', counter_cache: :posts_counter
  has_many :likes
  has_many :comments

  def recent_five_comments
    comments.limit(5).order(created_at: :DESC)
  end
end
