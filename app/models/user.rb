class User < ApplicationRecord

  #mount_uploader :image, ImageUploader
  has_many :products
  has_many :messages, dependent: :destroy


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable

end
