class ImageUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "#{APP_ROOT}/public/uploads/images"
  end
end