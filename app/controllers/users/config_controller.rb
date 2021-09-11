# frozen_string_literal: true

class Users::ConfigController < ApplicationController
  respond_to :json
  before_action :authenticate_user!

  def update_user_info
    return head :ok if current_user.update(user_params)

    head :bad_request
  end

  private

  def user_params
    params.require(:user).permit(
      :account_tier_type_id,
      :guild_id
    )
  end
end
