module ApplicationHelper
  def present(object)
    klass = "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)

    if block_given?
      yield(presenter)
    else
      presenter
    end
  end

  def present_collection(collection)
    collection.map { |element| present(element) }
  end
end
