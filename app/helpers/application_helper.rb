module ApplicationHelper
  def present(object, presenter_klass = nil)
    klass = presenter_klass || "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)

    block_given? ? yield(presenter) : presenter
  end

  def present_collection(collection, presenter_klass = nil)
    collection.map { |element| present(element, presenter_klass) }
  end
end
