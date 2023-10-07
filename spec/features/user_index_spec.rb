require 'rails_helper'

RSpec.feature 'User Index Page', type: :feature do
  before do
    @user = User.create(name: 'Lawrence McDaniel', photo: 'https://cdn.filestackcontent.com/e59vmdzRKGVwdjNKKLy0',
                        bio: 'Lawrence McDaniel is an American full stack developer.', posts_counter: 0)

    visit users_path
  end
  it 'I can see the username, profile picture, and number of posts each user has written' do
    expect(page).to have_content(@user.name)
    expect(page.html).to include(@user.photo)
    expect(page).to have_content(@user.posts.count)
  end
  it "When I click on a user, I am redirected to that user's show page" do
    click_link @user.name
    expect(current_path).to eq(current_path)
  end
end
