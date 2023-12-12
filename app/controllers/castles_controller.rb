class CastlesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  rescue_from ActiveRecord::RecordNotFound, with: :handle_castle_not_found

  def index
    @castles = current_user.castles
  end

  def show
    @castle = Castle.find(params[:id])
  end

  private

  def handle_castle_not_found
    flash[:alert] = "Castle not found"
    redirect_back fallback_location: castles_path
  end
end
