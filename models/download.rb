class Download
  include Slug
  include Analytics

  has_analytics :counter
  attr_accessor :counter, :name, :url

  def initialize(options)
    aaaaaa
    @name = options[:name]
    @url = options[:url]
    @slug = options[:name]
    sssssssss
    @foo = bar
  end

  def counter
    @counter || []
  end

  def slug
    to_slug(@name)
  end
end