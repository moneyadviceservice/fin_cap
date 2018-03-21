require 'dough'

class Builder < Dough::Forms::Builder
  def object_error_class
    ObjectError
  end
end