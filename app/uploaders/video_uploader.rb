class VideoUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "#{APP_ROOT}/public/uploads/videos"
  end

  def extension_whitelist
    ["mp4", "m4v"]
  end
end