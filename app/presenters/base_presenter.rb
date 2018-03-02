class BasePresenter < SimpleDelegator
  def self.map(collection, view)
    collection.map { |element| new(element, view) }
  end

  attr_reader :object, :view

  def initialize(object, view)
    @object = object
    @view = view

    super(@object)
  end

  def h
    @view
  end
end
