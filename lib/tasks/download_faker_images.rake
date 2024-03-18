# lib/tasks/download_faker_images.rake
require 'open-uri'

namespace :app do
  desc "Download random 'Paris, Girl' images for profiles"
  task download_images: :environment do
    images_dir = Rails.root.join('lib', 'assets', 'avatars')
    FileUtils.mkdir_p(images_dir) unless Dir.exist?(images_dir)

    num_images = 1000
    search_terms = ['paris', 'girl']

    num_images.times do |i|
      # Generate a random image URL with known working search terms
      image_url = Faker::LoremFlickr.image(size: "320x240", search_terms: search_terms)

      # Define file path
      file_path = File.join(images_dir, "avatar_#{i + 1}.jpg")

      # Download and save the image
      URI.open(image_url) do |image|
        File.open(file_path, 'wb') do |file|
          file.write(image.read)
        end
      end

      puts "Downloaded #{file_path}"
    end

    puts "Finished downloading #{num_images} images to #{images_dir}."
  end
end
