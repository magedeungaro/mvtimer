# frozen_string_literal: true

class MembersController < ApplicationController
  before_action :authenticate_user!
  respond_to :json

  def show
    respond_with AccountTierType.where(status: true), status: :ok
  end
end
