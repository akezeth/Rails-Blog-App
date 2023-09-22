require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'should update the post like counter' do
    first_user = User.create(name: 'Aklilu', posts_counter: 0)
    second_user = User.create(name: 'Dawit', posts_counter: 0)
    post = Post.create(author: first_user, title: 'Hello World', comments_counter: 0, likes_counter: 0)
    Like.create(user: first_user, post:)
    Like.create(user: second_user, post:)

    expect(post.likes_counter).to eq(2)
  end
end
