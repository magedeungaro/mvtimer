# frozen_string_literal: true

class TimeableObjectLog < ApplicationRecord
  belongs_to :timeable_object
  belongs_to :user
  belongs_to :server
  has_one_attached :photo

  def calculate_deadline(death_hour)
    tobj_interval = timeable_object.interval
    calculate_deathtime(death_hour)

    self.deadline = death_time + tobj_interval.seconds
  end

  private

  def calculate_deathtime(death_hour)
    server_timezone = server.timezone
    today = Time.now.in_time_zone(server_timezone)
    base_day_comparison = today.to_s[0..9]
    death_date_base_comparison = Time.parse("#{base_day_comparison} #{death_hour}")
    self.death_time = death_date_base_comparison
    return death_time if death_date_base_comparison < today

    self.death_time -= 1.day
  end
end
