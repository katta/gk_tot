class Universe
  attr_reader :name
  attr_reader :kingdoms

  def initialize(name, kingdoms)
    @name = name
    @kingdoms = Hash.new
    kingdoms.each {|kingdom| @kingdoms[kingdom.name.downcase] = kingdom}
  end

  def ruler
    @kingdoms.values.select { |kingdom| kingdom.allies.length >=3 }.first
  end

  def send(letter)
    @kingdoms[letter.to.downcase].send(@kingdoms[letter.from.downcase], letter.message)
  end
end
