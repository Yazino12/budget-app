require 'rails_helper'

RSpec.describe 'entities#index', type: :feature do
  before(:each) do
    @user = User.create!(name: 'Yasin', email: 'chr@gmail.com', password: '112233')
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log In'

    @group = Group.create!(user: @user, name: 'Sneakers', icon: 'https://icon.png')

    @entity1 = Entity.create!(author: @user, name: 'Deposit', amount: 88.9)
    @entity2 = Entity.create!(author: @user, name: 'Deposit', amount: 99.8)
    @entity3 = Entity.create!(author: @user, name: 'Deposit', amount: 100)
    @entity4 = Entity.create!(author: @user, name: 'Withdraw', amount: 77.99)

    @group_entity = GroupEntity.create!(group: @group, entity: @entity1)

    visit(group_entities_path(@group.id))
  end

  it 'shows the entity name' do
    expect(page).to have_content('Sneakers')
  end

  it 'shows the entity amount' do
    expect(page).to have_content('88.9')
  end
end
