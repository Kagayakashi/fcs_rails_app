module CastlesHelper
  def button_for_build
    content_tag(:button, 'Build', class: 'build-button')
  end

  def button_for_upgrade
    content_tag(:button, 'Upgrade', class: 'upgrade-button')
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
