class Guild < ApplicationRecord
  has_many :user
  has_many :timeable_object_log
  has_one_attached :photo
end
