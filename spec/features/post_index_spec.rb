require 'rails_helper'
​
RSpec.describe 'Post Index Page', type: :feature do
  describe 'Viewing Post Index page' do
    before(:each) do
      @user = User.create(name: 'Lawrence McDaniel', photo: 'https://cdn.filestackcontent.com/e59vmdzRKGVwdjNKKLy0',
                          bio: 'Lawrence McDaniel is an American full stack developer.')
​
      @post = Post.create(author: @user, title: 'Post 1', text: 'This is Post 1')
​
      @comment = Comment.create(post: @post, user: @user, text: 'Post 1 comment')
​
      visit user_posts_path(@user)
    end
​
    it 'I can see the user profile picture.' do
      expect(page.html).to include(@user.photo)
    end
​
    it 'I can see the user username.' do
      expect(page).to have_content(@user.name)
    end
​
    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content(@user.posts_counter)
    end
​
    it 'I can see a post title.' do
      expect(page).to have_content(@post.title)
    end
​
    it 'I can see some of the post body.' do
      expect(page).to have_content(@post.text)
    end
​
    it 'I can see the first comments on a post.' do
      expect(page).to have_content(@comment.text)
    end
​
    it 'I can see how many comments a post has.' do
      expect(page).to have_content(@post.comments_counter)
    end
​
    it 'I can see how many likes a post has.' do
      expect(page).to have_content(@post.likes_counter)
    end
​
    it 'I can see a section for pagination if there are more posts than fit on the view.' do
      expect(page).to have_button('Pagination')
    end
​
    it 'When I click on a post, it redirects me to that post show page.' do
      click_link @post.title
      expect(page).to have_current_path(user_post_path(@user, @post))
    end
  end
end
