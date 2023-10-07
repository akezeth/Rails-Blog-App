require 'rails_helper'
RSpec.describe 'User Show Page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Lawrence McDaniel', photo: 'https://cdn.filestackcontent.com/e59vmdzRKGVwdjNKKLy0',
                        bio: 'Lawrence McDaniel is an American full stack developer.',posts_counter: 0)
    @post1 = Post.create(author: @user, title: 'WordPress oAuth Provider for Open edX',
                         text: 'I’m a big advocate of leveraging WordPress as a marketing front end for Open edX',
                         comments_counter: 0,
                         likes_counter: 0)
    @post2 = Post.create(author: @user, title: 'Managing Your Open edX Backend With Terraform',
                         text: 'This is my second post.',
                         comments_counter: 0,
                         likes_counter: 0)
    @post3 = Post.create(author: @user, title: 'Flask Nested Blueprints Example', text: 'This is my third post.',
    comments_counter: 0,
    likes_counter: 0)
  end
  describe 'Page Content Testing' do
    before(:each) do
      visit user_path(@user)
    end
    it "I can see the user's profile picture." do
      expect(page).to have_selector("img[src='https://cdn.filestackcontent.com/e59vmdzRKGVwdjNKKLy0']")
    end
    it "I can see the user's username." do
      expect(page).to have_content(@user.name)
    end
    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content(@user.posts_counter)
    end
    it "I can see the user's bio." do
      expect(page).to have_content(@user.bio)
    end
    it "I can see the user's first 3 posts." do
      expect(page).to have_content(@post1.text)
      expect(page).to have_content(@post2.text)
      expect(page).to have_content(@post3.text)
    end
    it "I can see a button that lets me view all of a user's posts." do
      expect(page).to have_selector("a[href='#{user_posts_path(@user)}']")
    end
  end
  describe 'User Interaction Testing' do
    before(:each) do
      visit user_path(@user)
    end
    it 'When I click on See all posts, it redirects me to the index page' do
      click_link 'See all posts', href: user_posts_path(@user)
      expect(page).to have_current_path(user_posts_path(@user))
    end
  end
end
