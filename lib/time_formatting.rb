module TimeFormatting

  def method_missing(method, *args)
      pretty($1.to_sym) if method.to_s =~ /(.*)_pretty$/
  end

  def pretty(attribute)
    self.send(attribute).strftime('%F %I:%M%p')
  end

end
