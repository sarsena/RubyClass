class FormatDate
  def initialize(value1)
    @value1 = value1
  end

  def newMethod
    Date.strptime(@value1, "%m/%d/%Y").strftime("%Y-%m-%d")
  end

  def self.format(date)
    Date.strptime(date, "%m/%d/%Y").strftime("%Y-%m-%d")
  end
  
  def self.unformat(date)
    #####
  end
end
