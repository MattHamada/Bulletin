module TimeFormatting

  def method_missing(method, *args)
    if method.to_s =~ /(.*)_pretty$/
      pretty($1.to_sym)
    else
      super
    end
  end

  def pretty_timezone(datetime)
    datetime.strftime('%F %I:%M%p')
  end

  def pretty(attribute)
    self.send(attribute).strftime('%F %I:%M%p')
  end

end
