require 'date'
class Post
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :blog, :title, :body, :pubdate

  validates :title, presence: true

  def initialize(attrs={})
    attrs.each do |key, value|
      send("#{key}=", value)
    end
  end

  def publish(clock = DateTime)
    return false unless valid?
    self.pubdate = clock.now
    blog.add_entry(self)
  end

  def persisted?
    false
  end
end
