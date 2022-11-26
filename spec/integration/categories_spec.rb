require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  include Devise::Test::IntegrationHelpers
  before(:all) do
    @user = User.create(name: 'Neo', email: 'neo@neo.com', password: '123456')
    @group = Group.create(name: 'Books', icon: 'https://cdn-icons-png.flaticon.com/512/891/891462.png',
                          user_id: @user.id)
    @entity = Entity.new(name: 'expense on books', amount: 1000, group_id: @group.id, user_id: @user.id)
    sign_in @user
  end
  after(:all) do
    @entity.delete
    @group.delete
    @user.delete
  end

  context 'GET /index : ' do
    before do
      @user.save
      it 'returns http success' do
        get group_index_path
        expect(response).to have_http_status(:success)
      end
    end
  end
end
