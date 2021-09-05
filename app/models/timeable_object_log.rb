class TimeableObjectLog < ApplicationRecord
  belongs_to :timeable_object
  belongs_to :user
  belongs_to :server
  belongs_to :guild
  has_one_attached :photo
end
