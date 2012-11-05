class NormalGame < Game
  attr_accessor :instructions

  def initialize(options)
    super(options)
    @instructions = options[:instructions]
  end
end