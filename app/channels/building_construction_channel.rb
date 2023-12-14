class BuildingConstructionChannel < ApplicationCable::Channel
  def subscribed
    Rails.logger.debug("Subscribing to BuildingConstructionChannel for user #{current_user.id}")
    stream_for current_user
  end

  def unsubscribed
    Rails.logger.debug("Unsubscribed from BuildingConstructionChannel for user #{current_user.id}")
  end
end
