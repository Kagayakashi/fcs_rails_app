class BuildingConstructionJob
  include Sidekiq::Worker

  def perform(building_id, user_id)
    begin
      user = User.find(user_id)
      building = Building.find(building_id)

      until building.build_time.zero?
        building.build_time -= 10
        building.save

        sleep(10)
      end

      building.update(is_under_construction: false, build_time: 0)
      
      BuildingConstructionChannel.broadcast_to(user, { message: 'Building construction completed' })
    rescue StandardError => e
        Rails.logger.error("Error in BuildingConstructionJob: #{e.message}")
    end
  end
end