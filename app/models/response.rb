class Response < ActiveRecord::Base
  belongs_to :comment, polymorphic: true
  has_many :responses, as: :comment
end
