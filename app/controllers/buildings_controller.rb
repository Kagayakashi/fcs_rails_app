class BuildingsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_building, only: [:build, :cancel, :skip]
  rescue_from ActiveRecord::RecordNotFound, with: :handle_building_not_found
  before_action :authorize_user_building, only: [:build, :cancel, :skip]
  before_action :have_enough_resources, only: [:build]
  before_action :building_not_under_construction, only: [:build]
  before_action :building_is_under_construction, only: [:cancel]

  def build
    @building.update(is_under_construction: true, build_time: @building.time_requirement)
    redirect_to castle_path(@building.castle), notice: 'Construction of the building has begun'
  end

  def cancel
    @building.update(is_under_construction: false, build_time: 0)
    redirect_to castle_path(@building.castle), notice: 'Construction of the building has been canceled'
  end

  def skip
    level_up_and_redirect('Construction of the building has been finished')
  end

  private

  def level_up_and_redirect(notice_message)
    @building.level_up!
    redirect_to castle_path(@building.castle), notice: notice_message
  end

  def redirect_with_alert(castle, alert_message)
    redirect_to castle_path(castle), alert: alert_message
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

  def have_enough_resources
    castle = @building.castle
    if castle.food < @building.food_requirement
      redirect_with_alert(castle, 'Not enough food resource')
    elsif castle.wood < @building.wood_requirement
      redirect_with_alert(castle, 'Not enough wood resource')
    elsif castle.stone < @building.stone_requirement
      redirect_with_alert(castle, 'Not enough stone resource')
    elsif castle.iron < @building.iron_requirement
      redirect_with_alert(castle, 'Not enough iron resource')
    end
  end

  def building_not_under_construction
    redirect_to castle_path(@building.castle),
      alert: 'Building is already under construction' if @building.is_under_construction
  end

  def building_is_under_construction
    redirect_to castle_path(@building.castle),
      alert: 'Building is not under construction' unless @building.is_under_construction
  end
end
