class UserFile < ActiveRecord::Base
  mount_uploader :file, FileUploader
  PICTURE_EXTENSIONS = %w(jpg jpeg gif png)
  validates :file, presence: true

  belongs_to :user

  def picture?
    PICTURE_EXTENSIONS.include? file.file.extension
  end
end
