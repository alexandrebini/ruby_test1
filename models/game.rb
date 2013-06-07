class Game
  include Slug
  include Analytics

  has_analytics :views
  attr_accessor :developer, :name, :ratings, :views

  def initialize(options)
    @developer = options[:developer]
    @name = options[:name]
    @ratings = options[:ratings]
    @views = options[:views]
    @foo = options[:foo]
  end

  def ratings
    @ratings || {}
  end

  def slug
    to_slug(@name)
  end

  def views
    @views || []
  end
end