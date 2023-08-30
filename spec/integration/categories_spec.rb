require 'rails_helper'

RSpec.describe 'Authentication', type: :feature do
  let(:user) { User.new(name: 'Ashna', email: 'ashnaalipk@gmail.com', password: 'password') }

end

RSpec.describe 'Authentication', type: :request do
  let(:user) { User.new(name: 'Ashna', email: 'ashnaalipk@gmail.com', password: 'password') }

  before do
    sign_in user
  end

end

RSpec.describe 'User', type: :feature do
  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in user
  end

end