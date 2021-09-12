# frozen_string_literal: true

class TimeableObjectLogSerializer < ActiveModel::Serializer
  attributes :id, :description, :server, :timeable_object, :deadline

  def server
    object.server if object.server.present?
  end

  def timeable_object
    ActiveModelSerializers::SerializableResource.new(object.timeable_object) if object.timeable_object.present?
  end
end
