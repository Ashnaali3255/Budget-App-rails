FactoryBot.define do
    factory :category do
      name { Faker::Company.name }
      icon do
        Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'kfc.png'), 'image/png')
      end
      association :user
    end
  end