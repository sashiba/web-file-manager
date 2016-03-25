class User < ActiveRecord::Base
  has_secure_password
  has_many :user_files, dependent: :destroy

  validates :email, presence: true
  validates :name, presence: true
  validates :password, presence: true, allow_nil: true
end
