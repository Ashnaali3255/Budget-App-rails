require 'rails_helper'

RSpec.configure do |config|
  config.include Devise::Test::IntegrationHelpers, type: :request
end

RSpec.describe 'Authentication', type: :request do
  let(:user) { FactoryBot.create(:user) }

  before do
    login_as(user, scope: :user) 
  end

  it 'Should show categories for sign-in users' do
    get categories_path
    expect(response).to have_http_status(:success)
  end

  it 'Should show new categories page' do
    get new_category_path
    expect(response).to have_http_status(:success)
  end
end

RSpec.describe 'User', type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let(:category) { FactoryBot.create(:category, user: user, name: 'category') } 

  before do
    login_as(user, scope: :user) 
  end

  scenario 'User creates a new transaction' do
    visit categories_path
  
    expect(category).to be_valid
    visit "categories/#{category.id}"

    expect(page).to have_content('Create New Transaction')
  
    click_button 'Create New Transaction' 
  
    fill_in 'Name', with: 'Burger'
    fill_in 'Amount', with: 3
    select 'category', from: 'selected_category_id'

    add_transaction_btn = find("input[type='submit']")
    add_transaction_btn.click
  
    expect(page).to have_content(3)
  end  
end
