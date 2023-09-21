require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'should update the post comment counter' do
    first_user = User.create(name: 'Aklilu', posts_counter: 0)
    second_user = User.create(name: 'Dawit', posts_counter: 0)
    post = Post.create(author: first_user, title: 'Hello World', comments_counter: 0, likes_counter: 0)
    Comment.create(user: first_user, post:, text: 'Hi')
    Comment.create(user: second_user, post:, text: 'Hi')

    expect(post.comments_counter).to eq(2)
  end
end
