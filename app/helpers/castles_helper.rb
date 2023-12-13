module CastlesHelper
  def button_for_build(building)
    button_to(building.level.zero? ? 'Build' : 'Upgrade', build_building_path(building),
        method: :post,
        class: 'sm:w-[65px] sm:h-[25px] bg-green-400 border-solid border-2 border-indigo-600 rounded sm:text-sm')
  end

  def button_for_cancel(building)
    button_to('Cancel', cancel_building_path(building),
        method: :post,
        class: 'sm:w-[65px] sm:h-[25px] bg-red-400 border-solid border-2 border-indigo-600 rounded sm:text-sm')
  end

  def button_for_skip(building)
    button_to('Skip', skip_building_path(building),
        method: :post,
        class: 'sm:w-[65px] sm:h-[25px] bg-yellow-400 border-solid border-2 border-indigo-600 rounded sm:text-sm')
  end

  def seconds_to_time(seconds)
    return '0s' if seconds.nil? || seconds.zero?

    days, remaining_seconds = seconds.divmod(24 * 3600)
    hours, remaining_seconds = remaining_seconds.divmod(3600) unless remaining_seconds.nil?
    minutes, remaining_seconds = remaining_seconds.divmod(60) unless remaining_seconds.nil?

    time_components = []
    time_components << "#{days}d" if days.to_i > 0
    time_components << "#{hours}h" if hours.to_i > 0
    time_components << "#{minutes}m" if minutes.to_i > 0
    time_components << "#{remaining_seconds}s" if remaining_seconds.to_i > 0

    time_components.join(', ')
  end
end
