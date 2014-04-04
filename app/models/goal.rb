class Goal < ActiveRecord::Base

  validates :title, presence: true
  validates :public, inclusion: [true, false]
  validates :user, presence: true

  belongs_to(
    :user,
    inverse_of: :goals
  )

  has_many(
    :comments,
    class_name: "GoalComment",
    foreign_key: :goal_id,
    inverse_of: :goal
  )

end
