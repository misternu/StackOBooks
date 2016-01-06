class Post < ActiveRecord::Base
  has_many :responses, as: :comment
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings
end
