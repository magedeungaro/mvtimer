class TimeableObjectsLog < ApplicationRecord
  belongs_to :timeable_object
  belongs_to :user
  belongs_to :server
end
