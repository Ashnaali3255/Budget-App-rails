require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid properties' do
    user = User.new(name: 'Ashna', email: 'ashnaalipk@gmail.com', password: 'ashna25')

    expect(user.valid?).to eq(true)
  end

  it 'should not be valid with invalid properties' do
    user = User.new(password: 'Ashna25', email: 'ashnaalipk@gmail.com')
    expect(user.valid?).to eq(false)
  end
end