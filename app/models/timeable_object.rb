# frozen_string_literal: true

class TimeableObject < ApplicationRecord
  belongs_to :user
  has_many :timeable_object_logs
  has_one_attached :photo
end
