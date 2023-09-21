class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :likes
  has_many :comments

  def recent_three_posts
    posts.limit(3).order(created_at: :DESC)
  end
end
