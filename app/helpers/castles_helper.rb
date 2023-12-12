module CastlesHelper
  def button_for_build(building)
    button_to(building.level.zero? ? 'Build' : 'Upgrade', build_building_path(building), method: :post, class: 'build-button')
  end

  def button_for_cancel(building)
    button_to('Cancel', cancel_building_path(building), method: :post, class: 'cancel-button')
  end

  def button_for_skip(building)
    button_to('Skip', skip_building_path(building), method: :post, class: 'skip-button')
  end

  def seconds_to_time(seconds)
    return '0 seconds' if seconds.nil? || seconds.zero?

    days, hours, minutes, remaining_seconds = seconds.divmod(24 * 3600)
    hours, minutes, seconds = hours.divmod(3600), minutes.divmod(60), remaining_seconds.divmod(60)
  
    time_components = []
    time_components << "#{days} days" if days > 0
    time_components << "#{hours} hours" if hours > 0
    time_components << "#{minutes} minutes" if minutes > 0
    time_components << "#{seconds} seconds" if seconds > 0
  
    time_components.join(', ')
  end
end
