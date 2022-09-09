require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(name: 'Yasin', email: 'yasin.ei@gmail.com', password: '112233')
    @user.save!
  end

  it 'check the name is not blank' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'check if the name is not exceeding 30 characters' do
    @user.name = 'asdfasdf aksdfas kdfalsdf askd faksl faskdf as;lfdkaskl df'
    expect(@user).to_not be_valid
  end
end
