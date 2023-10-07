require 'rails_helper'
RSpec.describe 'Post Show Page', type: :feature do
  describe 'Viewing Post Show page' do
    before(:each) do
      @user = User.create(name: 'Lawrence McDaniel', photo: 'https://cdn.filestackcontent.com/e59vmdzRKGVwdjNKKLy0',
                          bio: 'Lawrence McDaniel is an American full stack developer.', posts_counter: 0)
      @post = Post.create(author: @user, title: 'Post 1', text: 'This is Post 1', comments_counter: 0, likes_counter: 0)
      @comment = Comment.create(post: @post, user: @user, text: 'Post 1 comment')
      visit user_post_path(@user, @post)
    end
    it 'I can see the post title.' do
      expect(page).to have_content(@post.title)
    end
    it 'I can see who wrote the post.' do
      expect(page).to have_content(@post.author.name)
    end
    it 'I can see how many comments it has.' do
      expect(page).to have_content(@post.comments_counter)
    end
    it 'I can see how many likes it has.' do
      expect(page).to have_content(@post.likes_counter)
    end
    it 'I can see the post body.' do
      expect(page).to have_content(@post.text)
    end
    it 'I can see the username of each commentor.' do
      expect(page).to have_content(@comment.user.name)
    end
    it 'I can see the comment each commentor left.' do
      expect(page).to have_content(@comment.text)
    end
  end
end
