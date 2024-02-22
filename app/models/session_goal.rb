class SessionGoal < ApplicationRecord
  belongs_to :session
  belongs_to :goal
end
