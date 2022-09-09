require 'rails_helper'

RSpec.describe Entity, type: :model do
  before :each do
    @user = User.create!(name: 'Yasin', email: 'yasin.erawi@gmail.com', password: '112233')
    @entity = Entity.new(author_id: @user.id, name: 'Deposit', amount: 98.99)
    @entity.save!
  end

  it 'check the name is not blank' do
    @entity.name = nil
    expect(@entity).to_not be_valid
  end

  it 'check if the name is not exceeding 20 characters' do
    @entity.name = 'Hello world Hello world Hello world'
    expect(@entity).to_not be_valid
  end

  it 'check the amount is not blank' do
    @entity.amount = nil
    expect(@entity).to_not be_valid
  end

  it 'check if amount is numeric' do
    @entity.amount = 'not-numeric'
    expect(@entity).to_not be_valid
  end

  it 'check if price is equal or greater than one' do
    expect(@entity.amount).to be >= 1
  end
end
