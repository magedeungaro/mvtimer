# frozen_string_literal: true

class TimeableObjectsController < ApplicationController
  respond_to :json
  before_action :authenticate_user!

  def index
    respond_with TimeableObject.all, status: :ok
  end

  def create
    timeable_object_params = timeable_object_params()
    timeable_object_params[:user_id] = current_user.id

    return head :ok if TimeableObject.create(timeable_object_params)

    head :bad_request
  end

  private

  def timeable_object_params
    params.require(:timeable_object).permit(
      :map_id,
      :interval,
      :name
    )
  end

  def timeable_object_filters
    params.permit(
      :current_user_tobj,
      :system_tobj,
      :public_custom_tobj
    )
  end
end
