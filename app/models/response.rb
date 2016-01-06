class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :comment, polymorphic: true
  has_many :responses, as: :comment
  has_many :votes
end
