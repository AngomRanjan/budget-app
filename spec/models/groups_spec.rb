require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:all) do
    @user = User.create(name: 'Neo', email: 'neo@neo.com', password: '123456')
    @group = Group.create(name: 'Books', icon: 'books.png', user_id: @user.id)
  end
  after(:all) do
    @group.delete
    @user.delete
  end

  describe 'Validations' do
    it 'should be valid' do
      expect(@group).to be_valid
      expect(@group.name).to eq('Books')
      expect(@group.icon).to eq('books.png')
    end
  end
end
