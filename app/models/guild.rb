class Guild < ApplicationRecord
  has_many :users
  has_many :timeable_object_logs
  has_one_attached :photo
end
