module ApplicationHelper
  def present(object, presenter_klass = nil)
    klass = presenter_klass || "#{object.class}Presenter".constantize
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

  def region_uk?(string)
    string == 'uk'
  end
end
