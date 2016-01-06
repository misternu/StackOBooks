class User < ActiveRecord::Base
  has_many :posts
  has_many :responses
  has_many :votes
end
