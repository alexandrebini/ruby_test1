module Analytics
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def has_analytics(key)
      @@key = key
      @@all = []

      class_eval do
        def analytics_object
          self.send(@@key)
        end
      end
    end

    def all
      @@all
    end

    def average_views
      return 0 if all.nil?
      total = 0
      all.each { |r| total += r.total_views }
      total / all.size
    end

    def average_last_week_views
      return 0 if all.nil?
      total = 0
      all.each{ |r| total += r.last_week_views }
      total / all.size
    end

    def new(options)
      object = super(options)
      @@all << object
      object
    end
  end

  def total_views
    return 0 if analytics_object.nil?
    total = 0
    analytics_object.each { |r| total += r[:count] }
    total
  end

  def today_views
    return 0 if analytics_object.nil?
    views = analytics_object.find { |r| r[:date] == Date.today }
    return 0 if views.nil?
    views[:count]
  end

  def last_week_views
    return 0 if analytics_object.nil?
    views = analytics_object.find_all{ |r| r[:date] >= (Date.today - 6) }
    return 0 if views.nil?
    total = 0
    views.each { |r| total += r[:count] }
    total
  end

  def last_month_views
  end
end