require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'should not create a post without title' do
    post = Post.create(author: User.create(name: 'Aklilu', posts_counter: 0))
    expect(post.valid?).to eq false
  end

  it 'should not create post with like/comment counter < 0' do
    post = Post.create(author: User.create(name: 'Aklilu', posts_counter: 0), title: 'First Post',
                       comments_counter: -1, likes_counter: -1)
    expect(post.valid?).to eq false
  end

  it 'should not create post with like/comment counter not an integer' do
    post = Post.create(author: User.create(name: 'Aklilu', posts_counter: 0), title: 'First Post',
                       comments_counter: 'Hi', likes_counter: 'Hi')
    expect(post.valid?).to eq false
  end

  it 'should create post with a title lesser than 250 characters' do
    post = Post.create(author: User.create(name: 'Aklilu', posts_counter: 0),
                       title: 'Lorem ipsum amet, consectetur adipiscing elit', comments_counter: 0, likes_counter: 0)
    expect(post.valid?).to eq true
  end

  it 'should update the user posts_counter' do
    user = User.create(name: 'Aklilu', posts_counter: 0)
    Post.create(author: user, title: 'Hello World', comments_counter: 0, likes_counter: 0)

    expect(user.posts_counter).to eq(1)
  end

  it 'retrieves recent posts' do
    user = User.create(name: 'Aklilu', posts_counter: 0)
    post = Post.create(author: user, title: 'Hello World', comments_counter: 0, likes_counter: 0)
    expect(user.valid?).to eq true
    expect(post.valid?).to eq true

    comment1 = Comment.create(user:, post:, text: 'this is a comment')
    comment2 = Comment.create(user:, post:, text: 'this is a comment')
    comment3 = Comment.create(user:, post:, text: 'this is a comment')
    comment4 = Comment.create(user:, post:, text: 'this is a comment')
    comment5 = Comment.create(user:, post:, text: 'this is a comment')

    recent_comments = post.recent_five_comments

    expect(recent_comments).to eq([comment5, comment4, comment3, comment2, comment1])
  end
end
