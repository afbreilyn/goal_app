class GoalComment < ActiveRecord::Base

  validates :goal, :body, presence: true

  belongs_to(
    :goal,
    inverse_of: :comments
  )

end
