# frozen_string_literal: true

class TimeableObjectService
  def self.calculate_deadline(timeable_object_log_id)
    tobj_log = TimeableObjectLog.includes(:timeable_object, :server).find(timeable_object_log_id)
    tobj_interval = tobj_log.timeable_object.interval
    server_timezone = tobj_log.server.timezone

    tobj_log.deadline = tobj_log.death_time.in_time_zone(server_timezone) + tobj_interval
  end

  def self.calculate_day(timeable_object_log_id, )
    tobj_log = TimeableObjectLog.includes(:server).find(timeable_object_log_id)
    server_timezone = tobj_log.server.timezone

    tobj_log.death_time.in_time_zone(server_timezone) + tobj_interval
  end
end
