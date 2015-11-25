class Post < ActiveRecord::Base
  belongs_to :student

  has_attached_file :post_photo, styles: { :large => "1000x1000#", :medium => "550x550#" }

  validates_attachment_content_type :post_photo, content_type: /\Aimage\/.*\Z/





end
