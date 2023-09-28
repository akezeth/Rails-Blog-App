require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  user = User.create(name: 'Ake', photo: 'pixabay.com/photos/sunset-beach-silhouettes-jump-570881', bio: 'bio',
                     posts_counter: 0)
  post = Post.create(author: user, title: 'test', text: 'text', comments_counter: 0, likes_counter: 0)

  describe 'GET /index' do
    before(:example) { get user_posts_path(user) }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('List of posts for a given user')
    end
  end

  describe 'GET /show' do
    before(:example) { get user_post_path(user, post) }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('Details of a specific post for a given user')
    end
  end
end
