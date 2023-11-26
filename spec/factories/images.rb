FactoryBot.define do
  factory :image do
    device
  end

  trait :first do
    file { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/Samsung1.jpg'), 'image/jpeg') }
  end

  trait :second do
    file { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/Samsung2.jpg'), 'image/jpeg') }
  end

  trait :third do
    file { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/Samsung3.jpg'), 'image/jpeg') }
  end

  factory :first_image, traits: [:first]
  factory :second_image, traits: [:second]
  factory :third_image, traits: [:third]
end
