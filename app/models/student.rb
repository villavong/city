class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts

  has_attached_file :photo, styles: { :large => "1000x1000#", :medium => "550x550#" }

  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
