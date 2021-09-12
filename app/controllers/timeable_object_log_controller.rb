# frozen_string_literal: true

class TimeableObjectLogController < ApplicationController
  before_action :authenticate_user!
  respond_to :json

  def create
    timeable_object_log = TimeableObjectLog.new(
      killed_by_user: timeable_object_log_params[:killed_by_user],
      timeable_object_id: timeable_object_log_params[:timeable_object_id],
      description: timeable_object_log_params[:description],
      server_id: timeable_object_log_params[:server_id],
      guild_id: timeable_object_log_params[:guild_id],
      status: true,
      deadline: timeable_object_log_params[:deadline]
    )

    timeable_object_log.user = current_user
    deadline_nil = timeable_object_log.deadline.nil?
    timeable_object_log.calculate_deadline(timeable_object_log_params[:death_hour]) if deadline_nil

    #return head :bad_request unless timeable_object_log.valid?

    timeable_object_log.save!

    head :ok
  end

  private

  def timeable_object_log_params
    params.require(:timeable_object_log).permit(
      :death_hour,
      :killed_by_user,
      :timeable_object_id,
      :description,
      :server_id,
      :guild_id,
      :status,
      :deadline
    )
  end
end
