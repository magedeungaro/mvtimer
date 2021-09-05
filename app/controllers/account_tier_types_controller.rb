# frozen_string_literal: true

class AccountTierTypesController < ApplicationController
  respond_to :json

  def index
    respond_with AccountTierType.where(status: true), status: :ok
  end
end
