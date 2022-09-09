require 'rails_helper'

RSpec.describe Group, type: :model do
  before :each do
    @user = User.create!(name: 'Yasin', email: 'yasin.erwi@gmail.com', password: '112233')
    @group = Group.new(user_id: @user.id, name: 'Sneakers', icon: 'icon.png')
    @group.save!
  end

  it 'check the name is not blank' do
    @group.name = nil
    expect(@group).to_not be_valid
  end

  it 'check if the name is not exceeding 20 characters' do
    @group.name = 'asdfasdf aksdfas kdfalsdf askd faksl faskdf as;lfdkaskl df'
    expect(@group).to_not be_valid
  end

  it 'check the amount is not blank' do
    @group.icon = nil
    expect(@group).to_not be_valid
  end

  it 'check if the icon is not exceeding 300 characters' do
    @group.icon = 'asdfasdf aksdfas kdfalsdf askd faksl
    faskdf as;lfdkaskl df asdfasdf
    askl df asdfasdf aksdfas kdfalsdf askd faksl faskdf
    as;lfdkaskl df asdfasdf aksdfas kdfalsdf askd faksl
    faskdf as;lfdkaskl df
    asdfasdf aksdfas kdfalsdf askd faksl
    faskdf as;lfdkaskl df asdfasdf
    askl df asdfasdf aksdfas kdfalsdf askd faksl faskdf
    as;lfdkaskl df asdfasdf aksdfas kdfalsdf askd faksl
    faskdf as;lfdkaskl df
    asdfasdf aksdfas kdfalsdf askd faksl
    faskdf as;lfdkaskl df asdfasdf
    askl df asdfasdf aksdfas kdfalsdf askd faksl faskdf
    as;lfdkaskl df asdfasdf aksdfas kdfalsdf askd faksl
    faskdf as;lfdkaskl df'
    expect(@group).to_not be_valid
  end
end
