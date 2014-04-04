class Comment < ActiveRecord::Base
<<<<<<< Local Changes

  validates :body, presence: true

  belongs_to :commentable, polymorphic: true

=======
>>>>>>> External Changes
end
