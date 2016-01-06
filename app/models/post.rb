class Post < ActiveRecord::Base
  has_many :responses, as: :comment
end
