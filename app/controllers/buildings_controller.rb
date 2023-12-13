class BuildingsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_building, only: [:build, :cancel, :skip]
  rescue_from ActiveRecord::RecordNotFound, with: :handle_building_not_found
  before_action :authorize_user_building, only: [:build, :cancel, :skip]
  before_action :building_not_underconstruction, only: [:build]
  before_action :building_is_underconstruction, only: [:cancel]

  def build
    if @building.level.zero?
      level_up!
      redirect_to castle_path(@building.castle), notice: 'Construction of the building has been finished'
      return
    end

    @building.is_under_construction = true
    @building.build_time = 180
    @building.save
    redirect_to castle_path(@building.castle), notice: 'Construction of the building has begun'
  end

  def cancel
    @building.is_under_construction = false
    @building.build_time = 0
    @building.save
    redirect_to castle_path(@building.castle), notice: 'Construction of the building has been canceled'
  end

  def skip
    level_up!
    redirect_to castle_path(@building.castle), notice: 'Construction of the building has been finished'
  end

  private

  def level_up!
    return if @building.level === 10

    @building.level += 1
    @building.food_requirement += 1000
    @building.wood_requirement += 1000
    @building.stone_requirement += 1000
    @building.iron_requirement += 1000
    @building.is_under_construction = false
    @building.build_time = 0
    @building.save
  end

  def level_down!
    return if @building.level.zero?

    @building.level -= 1
    @building.food_requirement -= 1000
    @building.wood_requirement -= 1000
    @building.stone_requirement -= 1000
    @building.iron_requirement -= 1000
    @building.is_under_construction = false
    @building.build_time = 0
    @building.save
  end

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

  def building_not_underconstruction
    if @building.is_under_construction
      redirect_to castle_path(@building.castle), alert: 'Building is already under construction'
    end
  end

  def building_is_underconstruction
    unless @building.is_under_construction
      redirect_to castle_path(@building.castle), alert: 'Building is not under construction'
    end
  end
end
