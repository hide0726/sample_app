class Article < ActiveRecord::Base
 validates :title, presence: true
 validates :abstract, presence: true
 validates :content, presence: true, length: { maximum: 1400 }
end
