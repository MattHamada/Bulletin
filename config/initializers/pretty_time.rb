module ActiveSupport
  class TimeWithZone
    def pretty_time
      time.strftime('%F %I:%M%p')
    end
  end
end