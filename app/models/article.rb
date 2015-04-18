class Article < ActiveRecord::Base
 validates :title, presence: true
 validates :abstract, presence: true
 validates :content, presence: true, length: { maximum: 1400 }
 default_scope -> { order('created_at DESC') }
end
