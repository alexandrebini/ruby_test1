class ExternalGame < Game
  attr_accessor :url

  def initialize(options)
    super(options)
    @url = options[:url]
  end
end