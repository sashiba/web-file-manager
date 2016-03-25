class File < ActiveRecord::Base
  mount_uploader :file, FileUploader

  belongs_to :user

  def picture?
  end
end
