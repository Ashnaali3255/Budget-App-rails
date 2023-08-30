require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.new(name: 'Ashna', email: 'ashnaalipk@gmail.com', password: 'ashna25') }

  before do
    user.save
  end
  it 'is invalid with invalid properties' do
    category = Category.new(name: 'Burger', icon: 'kfc.png')
    user.categories << category
    expect(category.valid?).to eq(false)
  end
end