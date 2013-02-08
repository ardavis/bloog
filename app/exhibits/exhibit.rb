require "delegate"

class Exhibit < SimpleDelegator

  def initialize(model, context)
    @context = context
    super(model)
  end

  def to_model
    __getobj__
  end

  def class
    __getobj__.class
  end
  
  def self.exhibits
    [
      TextPostExhibit,
      PicturePostExhibit,
      LinkPostExhibit
    ]
  end

  def self.exhibit_if_applicable(object, context)
    if applicable_to?(object)
      new(object, context)
    else
      object
    end
  end

  def self.applicable_to?(object)
    false
  end
  
  def self.exhibit(object, context)
    exhibits.inject(object) do |object, exhibit|
      puts "Object: " + object.inspect
      puts "Exhibit: " + exhibit.inspect
      puts ""
      exhibit.exhibit_if_applicable(object, context)
    end
  end
end
