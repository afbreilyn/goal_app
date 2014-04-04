class Goal < ActiveRecord::Base

  validates :title, presence: true
  validates :public, inclusion: [true, false]
  validates :user, presence: true

  belongs_to(
    :user,
    inverse_of: :goals
  )

  has_many :comments, as: :commentable

end
