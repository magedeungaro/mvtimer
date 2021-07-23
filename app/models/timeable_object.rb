class TimeableObject < ApplicationRecord
  belongs_to :timeable_object_type
  belongs_to :user
  has_many :timeable_object_log
end
