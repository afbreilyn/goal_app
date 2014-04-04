class UserComment < ActiveRecord::Base

    validates :user, :body, presence: true

    belongs_to(
      :user,
      inverse_of: :comments
    )

end
