class Micropost < ActiveRecord::Base
 has_many :entry
 belongs_to :user
 default_scope -> { order('created_at DESC') }
 validates :content, presence: true, length: { maximum: 1400 }
 validates :user_id, presence: true
end
