class Download
  include Slug
  attr_accessor :counter, :name, :url

  def initialize(options)
    @counter = options[:counter]
    @name = options[:name]
    @url = options[:url]
    @slug = options[:name]
  end

  def counter
    @counter || []
  end

  def slug
    to_slug(@name)
  end
end