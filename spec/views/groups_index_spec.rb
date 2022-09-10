require 'rails_helper'

RSpec.describe 'groups#index', type: :feature do
  before(:each) do
    @user = User.create!(name: 'Yasin', email: 'ch@gmail.com', password: '112233')
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log In'

    @group = Group.create!(user: @user, name: 'Sneakers', icon: 'https://icon.png')
    @group = Group.create!(user: @user, name: 'Food', icon: 'https://icon.png')
    @group = Group.create!(user: @user, name: 'Cars', icon: 'https://icon.png')

    visit(groups_path)
  end

  it 'shows the group name' do
    expect(page).to have_content('Sneakers')
  end

  it 'shows the group icon' do
    expect(page).to have_css('img', count: 3)
  end
end
