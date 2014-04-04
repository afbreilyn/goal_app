class Goal < ActiveRecord::Base

  validates :title, presence: true
  validates :user, presence: true

  belongs_to(
    :user,
    inverse_of: :goals
  )

end
