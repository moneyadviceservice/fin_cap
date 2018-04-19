require 'dough'

class FincapBuilder < Dough::Forms::Builder
  def object_error_class
    ObjectError
  end
end
