class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url(*args)
    [version_name, "default_avatar.png"].compact.join('_')
  end

  version :thumb do
    process resize_to_fill: [100, 100]
  end

  def extension_allowlist
    %w(jpg jpeg png tiff)
  end
end
