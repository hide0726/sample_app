class Post < ActiveRecord::Base
 validates :category_id, presense: true
end
