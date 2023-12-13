class UpdateConstructionTimeWorker
  include Sidekiq::Worker

  def perform(building_id)
    begin
      building = Building.find(building_id)
      user_id = building.castle.user

      until building.build_time.zero?
        building.build_time -= 10
        building.save

        sleep(10)
      end

      building.update(is_under_construction: false, build_time: 0)
      
      BuildingChannel.broadcast_to(user_id, construction_finished: true)
    rescue StandardError => e
        Rails.logger.error("Error in UpdateConstructionTimeWorker: #{e.message}")
    end
  end
end