class Engagement < ApplicationRecord
  belongs_to :resident
  belongs_to :session
end
