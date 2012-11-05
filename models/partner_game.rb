class PartnerGame < Game
  attr_accessor :instructions, :publisher

  def initialize(options)
    super(options)
    @instructions = options[:instructions]
    @publisher = options[:publisher]
  end
end