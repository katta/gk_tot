class Kingdom
  attr_reader :name
  attr_reader :emblum
  attr_reader :king
  attr_reader :allies

  def initialize(name, emblum, king = "")
    @name = name
    @emblum = emblum
    @king = king
    @allies = []
  end

  def send(from_kingdom, message)
    if accept_allegiance? message
      self.add_ally from_kingdom
      from_kingdom.add_ally self
    end
  end

  :private
  def add_ally(kingdom)
    @allies << kingdom
  end

  def accept_allegiance?(message)
    return false if message.nil?
    message.length >= (message.downcase.chars - @emblum.downcase.chars).length + @emblum.length
  end
end
