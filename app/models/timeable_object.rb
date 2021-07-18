class TimeableObject < ApplicationRecord
  belongs_to :timeable_object_type
  belongs_to :user
  has_many :timeable_objects_log
end
