class Letter
  attr_reader :from
  attr_reader :to
  attr_reader :message

  def initialize(from, to, message)
    @from = from
    @to = to
    @message = message
  end
end
