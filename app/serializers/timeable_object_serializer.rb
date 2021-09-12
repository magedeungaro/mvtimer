# frozen_string_literal: true

class TimeableObjectSerializer < ActiveModel::Serializer
  attributes :id, :map_id, :interval, :name, :photo

  def photo
    Cloudinary::Utils.cloudinary_url(object.photo.key) if object.photo.attached?
  end
end
