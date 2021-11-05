require 'rails_helper'

RSpec.describe AvatarUploader, type: :uploader do
  include CarrierWave::Test::Matchers
  include Rack::Test::Methods
  include ActionDispatch::TestProcess

  let(:image) { double('image', id: 123) }
  let(:uploader) { AvatarUploader.new(image, :file) }

  before do
    AvatarUploader.enable_processing = true
    File.open(Rails.root.join('spec', 'fixtures', 'images', 'me.jpg')) { |f| uploader.store!(f) }
  end

  after do
    AvatarUploader.enable_processing = false
    uploader.remove!
  end

  context 'the thumb version' do
    it "scales down to fit 100x100 pixels" do
      expect(uploader.thumb).to have_dimensions(100, 100)
    end
  end

  it "makes the image readable only to the owner and not executable" do
    expect(uploader).to have_permissions(0644)
  end

  it "has the correct format" do
    expect(uploader).to be_format('JPEG')
  end
end
