class Download
  include Slug
  include Analytics

  has_analytics :counter
  attr_accessor :counter, :name, :url

  def initialize(options)
    @counter = options[:counter]
    @name = options[:name]
    @slug = options[:name]
  end

  def counter
    @counter || []
  end

  def slug
    to_slug(@name)
  end
end