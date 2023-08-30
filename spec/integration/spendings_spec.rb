require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  let(:user) { User.new(name: 'Bilal Ahmed', email: 'bilal@gmail.com', password: 'password') }

  before do
    sign_in user
  end
end

RSpec.describe 'User', type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let(:category) { FactoryBot.create(:category, user:) }
  before do
    sign_in user
  end

end