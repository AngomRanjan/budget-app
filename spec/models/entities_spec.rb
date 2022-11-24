require 'rails_helper'

RSpec.describe Entity, type: :model do
  before(:all) do
    @user = User.create(name: 'Neo', email: 'neo@neo.com', password: '123456')
    @group = Group.create(name: 'Books', icon: 'books.png', user_id: @user.id)
    @entity = Entity.new(name: 'expense on books', amount: 1000, group_id: @group.id, user_id: @user.id)
  end
  after(:all) do
    @entity.delete
    @group.delete
    @user.delete
  end

  describe 'Validations' do
    it 'should be valid' do
      expect(@entity).to be_valid
      expect(@entity.name).to eq('expense on books')
      expect(@entity.amount).to eq(1000)
    end
  end
end
