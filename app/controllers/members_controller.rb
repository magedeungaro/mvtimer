# frozen_string_literal: true

class MembersController < ApplicationController
  before_action :authenticate_user!

  def show
    render json: { message: "If you see this, you're in! Magê é linda e fofa <3" }
  end
end