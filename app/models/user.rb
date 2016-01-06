class User < ActiveRecord::Base
  has_many :posts
  has_many :responses
  has_many :votes
  # validates hashed_password, presence: true
end
