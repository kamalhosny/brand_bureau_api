class FileUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  def base_path
    if Rails.env.production?
      'https://s3-us-west-1.amazonaws.com/brandbureau'
    else
      'http://localhost:3000'
    end
  end

  # def store_dir
  #   "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  # end

  # Create different versions of your uploaded files:
  # version :thumb, if: :image? do
  #   process resize_to_fit: [50, 50]
  # end

  # version :medium, if: :image? do
  #   process resize_to_fit: [200, 200]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w[jpg jpeg png svg 3gp mp4 wmv rmvb]
  end

  # def image?(new_file)
  #   new_file.content_type.start_with? 'image'
  # end
end
