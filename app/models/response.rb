class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :comment, polymorphic: true
  has_many :responses, as: :comment
  has_many :votes
  has_one :favorite
  has_one :post, through: :favorite

  validates :body, presence: true
  validates_length_of :body, minimum: 2, too_short: 'Please enter at least 2 characters.'

  def post_id
    return self.comment.id if self.comment.is_a?(Post)
    self.comment.post_id #recursion!
  end
end
