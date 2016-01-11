class Article < ActiveRecord::Base
 validates :title, presence: true
 validates :abstract, presence: true
 validates :content, presence: true, length: { maximum: 140000 }
 default_scope -> { order('created_at DESC') }
 mount_uploader :image, ImageUploader
end
