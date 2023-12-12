class BuildingsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_building, only: [:build]
  rescue_from ActiveRecord::RecordNotFound, with: :handle_building_not_found
  before_action :authorize_user_building, only: [:build]
  before_action :available_building, only: [:build]

  def build
    @building.is_under_construction = true
    @building.build_time = 180
    @building.save
    redirect_to castle_path(@building.castle), notice: 'Construction of the building has begun'
  end

  private

  def find_building
    @building = Building.find(params[:id])
  end

  def handle_building_not_found
    redirect_to root_path, alert: 'Building not found'
  end

  def authorize_user_building
    unless @building.castle.user == current_user
      redirect_to root_path, alert: 'You are not authorized to access this building'
    end
  end

  def available_building
    if @building.is_under_construction
      redirect_to castle_path(@building.castle), alert: 'Building is already under construction'
    end
  end
end
