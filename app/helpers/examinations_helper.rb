module ExaminationsHelper
  def time_from_second second_count
    return "00:00:00" if second_count <= 0
    hours = (second_count / 3600).floor
    minutes = (second_count / 60).floor - hours * 60
    seconds = second_count.floor % 60
    "#{hours.to_s.rjust(2, '0')}:#{minutes.to_s.rjust(2, '0')}:#{seconds.to_s.rjust(2, '0')}"
  end
end
