require 'rails_helper'

RSpec.describe 'category index page', type: :feature do
  before(:all) do
    @user = User.create(name: 'Neo', email: 'neo@neo.com', password: '123456')
    @group = Group.create(name: 'Books', icon: 'https://cdn-icons-png.flaticon.com/512/891/891462.png',
                          user_id: @user.id)
    @entity = Entity.new(name: 'expense on books', amount: 1000, group_id: @group.id, user_id: @user.id)

    visit root_path
    click_link 'LOG IN'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log In'
    visit group_path(@user.id, @group.id)
  end

  after(:all) do
    @entity.delete
    @group.delete
    @user.delete
  end

  describe 'tests for view categories#show' do
    it 'spec for show page ' do
      expect(page).to have_content 'Details'
      expect(page).to have_content 'Books'

      expect(page).to have_content 'expense'
      expect(page).to have_content 'Add new expense'
    end
  end
end
