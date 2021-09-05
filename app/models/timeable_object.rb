class TimeableObject < ApplicationRecord
  belongs_to :timeable_object_type
  belongs_to :user
  has_many :timeable_object_log
  has_one_attached :photo
end
